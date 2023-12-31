package swp.studentprojectportal.service.servicesimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import swp.studentprojectportal.model.Assignment;
import swp.studentprojectportal.model.Class;
import swp.studentprojectportal.model.Milestone;
import swp.studentprojectportal.model.Subject;
import swp.studentprojectportal.repository.IAssignmentRepository;
import swp.studentprojectportal.repository.IClassRepository;
import swp.studentprojectportal.repository.IMilestoneRepository;
import swp.studentprojectportal.repository.ISubjectRepository;
import swp.studentprojectportal.service.IMilestoneService;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class MilestoneService implements IMilestoneService {
    @Autowired
    IMilestoneRepository milestoneRepository;
    @Autowired
    IAssignmentRepository assignmentRepository;
    @Autowired
    IClassRepository classRepository;
    @Autowired
    ISubjectRepository subjectRepository;

    @Override
    public Page<Milestone> filterMilestone(int classId, String search, Integer pageNo, Integer pageSize, String sortBy, Integer sortType, Integer status) {
        Sort sort;
        if(sortType==1)
            sort = Sort.by(sortBy).ascending();
        else
            sort = Sort.by(sortBy).descending();
        return milestoneRepository.filterClassBySubjectManager(classId, search, status, PageRequest.of(pageNo, pageSize, sort));
    }

    @Override
    public Milestone findMilestoneById(Integer id){
        return milestoneRepository.findMilestoneById(id);
    }

    @Override
    public Milestone save(Milestone milestone) {
        return milestoneRepository.save(milestone);
    }

    @Override
    public void addClassAssignment(Class classA) {
        List<Assignment> assignmentList = assignmentRepository.findAssignmentBySubjectId(classA.getSubject().getId());
        for (Assignment ass : assignmentList) {
            Milestone assign = new Milestone();
            assign.setTitle(ass.getTitle());
            assign.setDescription(ass.getDescription());
            assign.setAclass(classA);
            save(assign);
        }
    }

    @Override
    public boolean addNewMilestone(Integer classId, String title, String description, LocalDateTime startDate,LocalDateTime endDate,int status) {
        // get class by classId
        Class _class =  classRepository.findClassById(classId);
        if(_class == null) {
            return false;
        }

        // create obj milestone
        Milestone milestone = new Milestone();
        milestone.setTitle(title);
        milestone.setDescription(description);
        milestone.setStatus(status == 1 ? true : false);
        milestone.setAclass(_class);
        milestone.setProject(null);
        milestone.setStartDate(java.sql.Timestamp.valueOf(startDate));
        milestone.setEndDate(java.sql.Timestamp.valueOf(endDate));
        if(milestoneRepository.save(milestone) != null)
            return true;
        else
            return false;
    }

    public boolean updateMilestone(Integer milestoneId,String title,String description,LocalDateTime startDate,LocalDateTime endDate,int status) {
        Milestone milestone = milestoneRepository.findMilestoneById(milestoneId);
        if(milestone == null)
            return false;
        milestone.setTitle(title);
        milestone.setDescription(description);
        milestone.setStartDate(java.sql.Timestamp.valueOf(startDate));
        milestone.setEndDate(java.sql.Timestamp.valueOf(endDate));
        milestone.setStatus(status == 1 ? true : false);
        if(milestoneRepository.save(milestone) != null)
            return true;
        else
            return false;
    }
}
