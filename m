Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68341459E4
	for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 11:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719486511; cv=none; b=GQfJJhfE8Am+14D+6LxdqJuN6//zXSPc/6crbMdxa7oQ4vYvu6fI31O2eP2kq/KWJprlk4qCeSUBE5c3q0K8qBMaM6yrVhd2k8NBZ3XYVvmBDamlw06GWCJABJ9UOROI7hrZFVdi6n52HKH3IaLleB6Yyvm6d4apgY4hGBZCXXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719486511; c=relaxed/simple;
	bh=g2tMeYBBU32MyYq1LF6mPJf6c7+VA5gf6DhZZ0VvATQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a7sVQGnjUJW/kc5HPCzhaoZlnsYmuT1D1tKOMWHQOLZ0RUoUuD/8AUkbDHbqgM1g27QSKUgGrAvew0qp6OY8vM8fdkBjx+e8gaxmrNg1S9/l7ehFg6V3LHLgqlOIObnZ1jNXRFDjRxyzdvlUlZxagyPz8NW3831EF3jBCTCDqk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PxLtc0++; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PxLtc0++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719486508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=7MifnowyypYeNXf5Vzj1g4nh86ByXuXYBkV6fUgK558=;
	b=PxLtc0++A0x7QsfEqTw112n71KCXAxTLIeeHGojKTZkzZlf05ldswbl63876Z6PDJEEUCS
	6OpGt97YCmSyMppwuN/VstIiTQo9Nl1kMWLZuakaJLLI4dv9FlkuE+qrzWN2DpSOHi4oYr
	DXllHQOyNHYhqUhGeuwDGFFdikJsjds=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-yXo8rCJvMGeuyewYNQfbpg-1; Thu, 27 Jun 2024 07:08:26 -0400
X-MC-Unique: yXo8rCJvMGeuyewYNQfbpg-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6af35481ea6so120004866d6.1
        for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 04:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719486506; x=1720091306;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7MifnowyypYeNXf5Vzj1g4nh86ByXuXYBkV6fUgK558=;
        b=AlcjIYCbtQ4wLHhExZoQDRbvfzKM8SxKMTpk0486qM7n4Xvd4DdA88ZguIOI8LEF2T
         lGzz7FbOmgr3wmr3At0KeTwUXk60mEMkEszdbizu+Kcxll+Uxfa1MyrWH+6hM5CME7fM
         +V1zYIfBFOFauOLIgU1oe9UrFUKhTPENpGmxwP6ss/jg7WwyBYBTO31LLAU57m2PeZAn
         qhlc/D2VHXR3WLtTWJ/dRUPpKUIve2xbjXUEqJv989l/7I/YsnXQEb/qbt0n2fCBfFxU
         ReJ4TEP7DysnvjYYwnhy/qGXHRZpc5NeUFYsoCHhJtNR0aPq69isNbJ2RShg4tVwihZ4
         j2og==
X-Gm-Message-State: AOJu0YwuHDdGO7kaS8nOZIduMwrM+YE3IKvQ+Jj7OzUlo/2ZtZdcF4OW
	vBG5JDsQZYb7JX5iS55UHTpCTOLjxKz45DLm8VGNF2zlcIOxzJV+E4R6Fj85mrDIhEbNB6KrVnW
	ejxoz/pUU/wiN0T1GPJC4HhZkdGOjznfEQX/eITaQ4egQj07CNiJLulis9UqiTcCYv3wK3zkrFd
	dwe2lWy4+GiUaloQuoR+UeHGcp+PsIBHqCvLPNv1XwjwHUT+Cn
X-Received: by 2002:a05:6214:c48:b0:6b4:fe71:4866 with SMTP id 6a1803df08f44-6b5409bf2b0mr161737876d6.23.1719486506021;
        Thu, 27 Jun 2024 04:08:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg3+Zp1FehCZj6v7DqUV73EEHcyGSgSUx5hrik9dta0/G6EKMQCirKSNgi05VbS/Qrl8ZOEg==
X-Received: by 2002:a05:6214:c48:b0:6b4:fe71:4866 with SMTP id 6a1803df08f44-6b5409bf2b0mr161737636d6.23.1719486505684;
        Thu, 27 Jun 2024 04:08:25 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b59252f8bcsm4196396d6.68.2024.06.27.04.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:08:25 -0700 (PDT)
Date: Thu, 27 Jun 2024 13:08:21 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: harald.mommer@opensynergy.com, mvaralar@redhat.com, sgarzare@redhat.com
Subject: [PATCH v1] virtio-can: define out of rage can-id and sdu
Message-ID: <Zn1IJT/awG4NZijw@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Explain when a message is out of range.

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
v0 -> v1
    * Use length of the field wording to indicate out of range
    * Add when sdu length is out of range
---
 device-types/can/description.tex | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/device-types/can/description.tex b/device-types/can/description.tex
index 2511d9c..fa56abd 100644
--- a/device-types/can/description.tex
+++ b/device-types/can/description.tex
@@ -191,6 +191,14 @@ \subsubsection{Controller Mode}\label{sec:Device Types / CAN Device / Device Ope
 invalid state with VIRTIO_CAN_RESULT_NOT_OK in \field{result} and MUST
 NOT schedule the message for transmission.
 
+Note that the \field{can_id} field of a CAN frame is out of range when its
+length is more than 11 bits for standard frames or more than 29 bits for
+extended frames. The length of the \field{sdu} field is out of range when it
+uses more than 8 bytes for standard frames. If the VIRTIO_CAN_F_CAN_FD feature
+has been negotiated, the lenght of the \field{sdu} field is out of range when
+it uses more than 8 bytes and is not in the set [ 12, 16, 20, 24, 32, 48, 64 ]
+bytes.
+
 If the parameters are valid the message is scheduled for transmission.
 
 If feature VIRTIO_CAN_F_CAN_LATE_TX_ACK has been negotiated the

base-commit: 37c6a406678a5ee891fdf5671298cb4fcfa517f2
-- 
2.42.0

