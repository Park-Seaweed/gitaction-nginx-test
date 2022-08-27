package com.project.instagramcloneteam5.model;

import com.project.instagramcloneteam5.exception.advice.Code;
import com.project.instagramcloneteam5.exception.advice.PrivateException;
import com.project.instagramcloneteam5.dto.supportdto.CommitRequestDto;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.util.StringUtils;

import javax.persistence.*;


@Getter
@Entity
@NoArgsConstructor
public class Commit {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Long id;

    @Column(nullable = false)
    private String content;

    @ManyToOne
    @JoinColumn(name = "member_id")
    private Member member;



    @ManyToOne
    @JoinColumn(name = "comment_id")
    private Comment comment;


    public Commit(Comment comment, CommitRequestDto commitRequestDto, Member member) {
        if (!StringUtils.hasText(commitRequestDto.getComment())) {
            throw new PrivateException(Code.WRONG_INPUT_COMMENT);
        }
        this.comment = comment;
        this.content = commitRequestDto.getComment();
        this.member = member;

    }
}
