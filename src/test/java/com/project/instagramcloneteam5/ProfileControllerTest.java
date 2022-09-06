package com.project.instagramcloneteam5;

import com.project.instagramcloneteam5.controller.HealthController;
import org.junit.jupiter.api.Test;
import org.springframework.mock.env.MockEnvironment;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

public class ProfileControllerTest {
    @Test
    public void real_profile_조회(){
        String expectedProfile = "real";
        MockEnvironment env = new MockEnvironment();
        env.addActiveProfile(expectedProfile);
        HealthController controller = new HealthController(env);

        String profile = controller.profile();
        assertThat(profile).isEqualTo(expectedProfile);
    }
}
