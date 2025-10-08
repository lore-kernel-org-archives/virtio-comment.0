Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3C82EC56F
	for <virtio-comment@lists.linux.dev>; Wed,  8 Oct 2025 14:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759935565; cv=none; b=vCqYQ2kTi+EaOlicRwbrxU1DbzDJTPLAI2KpgA5n3NQSpgbH5g6H2Qj5hwEpaiBRhiufqdx3cNPBUSft2zaYVqQucpz+k3gLzSGUyz6nQxKkj4a9ZCsqzXe3wjBKBPTaoJIH2nOA2h8UGj/IcXmve6wLCzbY0rwZRcnRoVXX9kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759935565; c=relaxed/simple;
	bh=v1cOm4zO3cQBb5j06Xey8qTKjnoTV8CUMiycATcCyxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m67cO5E4DZ5jh5UDoHzuIe5M7ifJMbCwtMc630QMbVq55FEh/hJwhwRQuLjSZ+tQcwL9xoYDF7qDGdx6WBL7xKNtq24IDsuQ1BmK+ZFYYaSr+OATQJLPvvIU7E77NJ+XMC60w72aZYduLXzm1LCk3rh1J8qmqvBYhSmoYFS8ve0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A7RiPx6O; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A7RiPx6O"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3f42b54d1b9so28276f8f.0
        for <virtio-comment@lists.linux.dev>; Wed, 08 Oct 2025 07:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759935561; x=1760540361; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1cOm4zO3cQBb5j06Xey8qTKjnoTV8CUMiycATcCyxI=;
        b=A7RiPx6ODpDSZng22YkVx4RPrcUJfl9sHu49SvJggoJ9CnjwsDPtNrLQmPjacndPKf
         0pZ5drfwlA2hou3yVuBxkvHxGuIy59wzF0qQmOr87/x7zj6d4fJEJgPmFDJeoLOQH7hS
         RAN7Z0aj/kd/cCOGjN6bnfcf+64FhtQaJbbr9aeGwgg0AHzhdwzTkjl5IoL+mgK9vd9A
         hlfaAiSWCPpw6Bc31194DyZkgySPz0eL6goKUpqjtAcJt/ApHo0dH6r8C7XM9VQD80Fl
         7VefpYVrbrgT2DrHaOsbt7QUd+6eTSqOZfYqX9YzTSEtmbhwhYOH5xuG8YZxhJ2aReqw
         OFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759935561; x=1760540361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1cOm4zO3cQBb5j06Xey8qTKjnoTV8CUMiycATcCyxI=;
        b=SvFxIvavNTdqNjyJywJERWbVw5V4w3f2dLNWka418i2d/gqYpcT0IEYuNOBVQ8h+fU
         4TWIzkkq2nCF4Ex51bCypzBGK5aScainnx6O1ZmUCR/gAK+UgafTR/2v39TREEchePhE
         yTc6OklGiSrkpSjWL9wQiqvaAuXZWDQib5V2yMgQQsm+6zHBymW44HwkapNvNWCNuzag
         D9TOWp2Hd1BxKIstYonSOT2A2mHzCNKFv/U3RhcuU/a6dxsCGsR0KeM3g2lWpPS3lXVD
         /36xrQhsfoihLYD3IHRDSWZrX7xxyz+bu8Me3fOnIhW1zkELeSV7Ae2zlIKTbvql+BZ+
         2hlw==
X-Gm-Message-State: AOJu0Yw28hX4kUKWZOhUILT8gv96NN/zzfQTb/DzgQW38hp+uSBJPmZ5
	k3a9DeyU0NdyTh4pqtC6e0JukVrA7sr8kJoEa4+ytsnZaClZ+MopQfqMN6Oek73MazrH1fbF/Ij
	gloS4
X-Gm-Gg: ASbGnct4duWcE/bdzX118W2lXU1yxhdLGMC9i55qpzvhzKthPnzS23kvLqM3JzYJ2CI
	hgu20BnRxXP3pUyu3lYk7417OmT6OSIzUJXXe6m02woPX2u9CGEl7QRG2nzsy8ZtEF+eTMGRENx
	ReHlRw4hCrWYyaey4bBLBkKTQgicvxpP4kTRTkqBST4qhaSI+Vqv8GUIB6OBJp7IyvjrsbxXf9H
	+P5gOYJirRikFeZrJQzQQiGsK/wLY0jnLXsx5+MNizMVENEHVfPU2gm+X7f51mwnMoFmaEj92wQ
	OeWnyonmd+owyFut0t2ALNPD6QP93P0Dy6noBA1UqpjF1ExcLMjgxLIfcO2oRkHUz/ajkQ8K2MT
	VUAKzx2GmRIqiCfrNqU7RUF6AA56SONIgci2KPBF/6KQBQ2xphY4=
X-Google-Smtp-Source: AGHT+IEVtbCMuWiZMVXeCsX525AXC3Zq7o8zAMeNOxMetacsf4xzQIIhFZhpxZzuH3KrUI0Rw5D2Uw==
X-Received: by 2002:a05:6000:2003:b0:3ee:13ba:e133 with SMTP id ffacd0b85a97d-42666ac466amr2360437f8f.1.1759935561274;
        Wed, 08 Oct 2025 07:59:21 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f011bsm30827029f8f.46.2025.10.08.07.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:59:17 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 172FC5F860;
	Wed, 08 Oct 2025 15:59:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Robin Cover <robin@oasis-open.org>
Subject: [PATCH 1/9] LICENSE.md: convert html to proper MarkDown
Date: Wed,  8 Oct 2025 15:59:08 +0100
Message-ID: <20251008145916.2626143-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251008145916.2626143-1-alex.bennee@linaro.org>
References: <20251008145916.2626143-1-alex.bennee@linaro.org>
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

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Cc: Robin Cover <robin@oasis-open.org>
---
 LICENSE.md | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/LICENSE.md b/LICENSE.md
index ef558ec..600b966 100644
--- a/LICENSE.md
+++ b/LICENSE.md
@@ -1,7 +1,6 @@
-<div>
-<h2>License Terms</h2>
+License Terms
+-------------
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

