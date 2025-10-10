Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EB624DCF9
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 11:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095217; cv=none; b=Drt62MODqsFd++gbqK5qi/x4P+shqqjzcEg+48Wu0nlZjI/FhjtNXA4kRq5JBE3cjr83cCb29uy79/otCwVCeFY0DMpBS1xXJDFaDRSRG2i348df2YBAIPLFEwn49/3zaAww4VR1iRyN1pIN9kSk5Ygh5p9fFti5DUNg3p3TzL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095217; c=relaxed/simple;
	bh=KSKuvyqC0ysI3/u/5/NQy0mjvinxsaM/ep8RIHer9Ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AVl+UpgufEYiHWcKsvIlOpMyamNpS8oTfQZMyPIWAK73+bh/M4hAw/MbaMvrK20PkMNlv2ILHL23bY2PChvasLWgvXIqvRbEkZ2DdqcIfwO4sUlon+Xw4v53LztFdkE/b4uiQubt+PlBTzPTMK77tiuVmN8ny0mqN4YvegBYdQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s+4HUNfw; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s+4HUNfw"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so363846666b.0
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 04:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760095214; x=1760700014; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSKuvyqC0ysI3/u/5/NQy0mjvinxsaM/ep8RIHer9Ho=;
        b=s+4HUNfwLHHWeAOrN3n6jdo7LFRh4enBExJFtStLGK1O44e3X6ttjfBb+R/DDdQcJ3
         wjX+Rrk6TpEWr0JC0ANZWW3Wvm/29LA2OIXi6/cUxI1QrL/zzwFdk1cEi263PMdhW7eR
         XSgaJcoUwvAxmW9GYpTY2ikECvhN93t50ZHYhq+Kk5GVehjEPFuZ7zDDY5y+/uwZotRm
         NvX3qgnrHXM2IICt//n4BN6eghFljhPly6Hag/VzVGkSF9mN6Wf/g6Az1cccwSY2/8SC
         JCCN7XCcpuBwJ1x+XdNH1xgNVeFmjK/yr0Rtxyi3OoJwg1IvKA9NBsvoJG8jBGDDNlkC
         IJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760095214; x=1760700014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSKuvyqC0ysI3/u/5/NQy0mjvinxsaM/ep8RIHer9Ho=;
        b=A4Tn1UpRKxB+ujpVHjGEFlKDAgJkcW6v7J5BvDMKeVwQlE3/mg4CkN/gzCf9dtYXX/
         qGoI2paRR78fS9FPN6QDhrfCYHyTOMrFQFQZcl89H1Sg6m7eZ263WMLTyUOSXWg6Kp8F
         ooBeJaEE/5q+q3buOP+lJFE7Bgx+CGe3av75LLcZmkmGByjOr+tkbhM2Yjo0cXZgQxPX
         MRcQ5Glp2XJYzs0c4ZrpxqWTZm31zgkf4PrsukNF3DIlHuc7ZLiXalDjvv9ku6exdISZ
         XCj0in/u4KhIQZP5z4cWDQRyoq5h22GLMD41ELnyNxdJJY07SLpNOqHEdGDeLqi1SCp8
         yehQ==
X-Gm-Message-State: AOJu0YyDYdbeIYysZot39XpCdA2ncniwK7ORFnLa3CJKBON4tw5JxgXT
	mciU/al4hxdWVAOEJudfq4CkN6U44cJByMrbVRhvesc/GcLWDBDUigp1VxAyhx7JMPE=
X-Gm-Gg: ASbGncsU/SEMnIMnMD/NPAHMRC8MvtRssfyJ7+TnKj/GNMPE69o/OEPPSXPODu21Yh+
	5f87aJK2mSHMniKndc1gqqthDJPfbwMDiaZpNmrb/fJNkNTWzac5280vgr2cmG0MHTiIKR0ZE0E
	fGO/344zegylNq8hM2mVA/yVHyChIi8T9MX+clhdvG2TeS3AyIQwrRvXWurpNYWb1CXfXKJ5YQm
	F9ugp8zZM6V9ke0fNDQ4y9u/E3ovyIhKYSvVK8CE1pi5Fh86wazN5YdONzCWE1rGDo+XEP0SreB
	9NWaQ+R7r5R30Pin2+Ivz9lg/+5vBSJIPcaSsjWCg2OZZ46NQsWPWWWXf3E6NczH+qztQP0K/RG
	qtvQVuARsBznZ+hfIlxVrTwmZ+lQC8S9W7SldTJEfo0QpmA==
X-Google-Smtp-Source: AGHT+IEHDRFV7fEdrg8YO7/EUPswI2TaPWSGoyhpfvz/Im/8+XFLXC3GOpP9xL2gamEPh1bznE3cMA==
X-Received: by 2002:a17:907:7213:b0:b41:a571:21b0 with SMTP id a640c23a62f3a-b50ac1cc421mr1062865366b.39.1760095213740;
        Fri, 10 Oct 2025 04:20:13 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad826sm203499266b.14.2025.10.10.04.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:20:11 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 985F75FA1B;
	Fri, 10 Oct 2025 12:20:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Robin Cover <robin@oasis-open.org>
Subject: [PATCH v2 01/10] LICENSE.md: convert html to proper MarkDown
Date: Fri, 10 Oct 2025 12:20:01 +0100
Message-ID: <20251010112010.3880438-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010112010.3880438-1-alex.bennee@linaro.org>
References: <20251010112010.3880438-1-alex.bennee@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

There is no point embedding HTML inside the markdown document. It just
makes it messy to edit. The boilerplate text is maintained.

Cc: Robin Cover <robin@oasis-open.org>
Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Message-ID: <20251008145916.2626143-2-alex.bennee@linaro.org>
---
 LICENSE.md | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/LICENSE.md b/LICENSE.md
index ef558ec..8078023 100644
--- a/LICENSE.md
+++ b/LICENSE.md
@@ -1,7 +1,5 @@
-<div>
-<h2>License Terms</h2>
+## License Terms
=20
-<p>Content in this GitHub code repository has been <a href=3D"https://www.=
oasis-open.org/policies-guidelines/ipr#def-contribution">contributed</a> by=
 OASIS TC Members, and is governed by the OASIS policies, including the <a =
href=3D"https://www.oasis-open.org/policies-guidelines/ipr">Intellectual Pr=
operty Rights (IPR) Policy</a>, the <a href=3D"https://www.oasis-open.org/p=
olicies-guidelines/tc-process">Technical Committee (TC) Process</a>, <a hre=
f=3D"https://www.oasis-open.org/policies-guidelines/bylaws">Bylaws</a>, and=
 the Technical Committee's choice of <a href=3D"https://www.oasis-open.org/=
policies-guidelines/ipr#def-ipr-mode">IPR Mode</a> (<i>viz</i>, <a href=3D"=
https://www.oasis-open.org/policies-guidelines/ipr#Non-Assertion-Mode">Non-=
Assertion Mode</a>), including any applicable <a href=3D"https://www.oasis-=
open.org/committees/virtio/ipr.php">declarations</a>. Feedback from non-TC =
members, if any, is governed by the terms of the <a href=3D"https://www.oas=
is-open.org/policies-guidelines/ipr#appendixa">OASIS Feedback License</a>.<=
/p>
+Content in this GitHub code repository has been [contributed](https://www.=
oasis-open.org/policies-guidelines/ipr#def-contribution) by OASIS TC Member=
s, and is governed by the OASIS policies, including the [Intellectual Prope=
rty Rights (IPR) Policy](https://www.oasis-open.org/policies-guidelines/ipr=
), the [Technical Committee (TC) Process](https://www.oasis-open.org/polici=
es-guidelines/tc-process), [Bylaws](https://www.oasis-open.org/policies-gui=
delines/bylaws), and the Technical Committee's choice of [IPR Mode](https:/=
/www.oasis-open.org/policies-guidelines/ipr#def-ipr-mode) (_viz_, [Non-Asse=
rtion Mode](https://www.oasis-open.org/policies-guidelines/ipr#Non-Assertio=
n-Mode)), including any applicable [declarations](https://www.oasis-open.or=
g/committees/virtio/ipr.php). Feedback from non-TC members, if any, is gove=
rned by the terms of the [OASIS Feedback License](https://www.oasis-open.or=
g/policies-guidelines/ipr#appendixa).
=20
-<p>Description of this repository is presented in the <a href=3D"https://g=
ithub.com/oasis-tcs/virtio-spec/blob/master/README.md">README</a> file, and=
 guidelines for contribution/participation are given in the <a href=3D"http=
s://github.com/oasis-tcs/virtio-spec/blob/master/CONTRIBUTING.md">CONTRIBUT=
ING</a> file.</p>
-</div>
+Description of this repository is presented in the [README](https://github=
.com/oasis-tcs/virtio-spec/blob/master/README.md) file, and guidelines for =
contribution/participation are given in the [CONTRIBUTING](https://github.c=
om/oasis-tcs/virtio-spec/blob/master/CONTRIBUTING.md) file.
--=20
2.47.3

