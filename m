Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303518F5B
	for <virtio-comment@lists.linux.dev>; Thu, 20 Feb 2025 15:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740067014; cv=none; b=iYSLuY24v2YHqkP/IFnkxEyuwssbjWUA8F5gecIjmivfEvQLo+rPxt8h2WsKX9rce5VXODbNDq4XI1WzF3yADFsM35ji3azssgPviRXu3a63cKkADjjoNb1lx1avEV3b/XLo9H5/055sE8i2AcX4hbkTmK89IxaMv1xqmaRCQcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740067014; c=relaxed/simple;
	bh=KYc9J1w6F4vmV3wLeiE+3jASHl77e35B36f3aCaGTTc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=srmSpzCHJb+mKG0/Z4B8pInljUa8ZxpvVa1emsScGVY/JQmM1NYM4pOBYZWYqzh1f1Lb0blXdpPpJxrvJiXXZgzcRM/xuOnWsYOH3BcKxzs20upvxEU6LWaVUDz7tezOMlU6UKydZK34ngRzWNnyqtLQ5aNwkCtwW2ET8EVq7s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VrUGasIS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VrUGasIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740067011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OZteUXPqbIHhKH/Hg5TY2oOE1WHCWV7ixwuZvWdw8CI=;
	b=VrUGasISaxQ8N2EgnJTCAwqyaEg93i7Z9sQ4NzRc0M3buumCikh8d5fdj6JrkMVxaIDpCL
	NSgGBYTcjEoo6GIm0OOm46wY71Ni86J+j7a8RS0FKdyI8/gHQbX2r6Wy0bxgqzdWed6yIx
	yC+6emkWT8mtp+A7kXOWBW3u0lvAtJk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-116-sdXqK49zNmOevyODIKQC8g-1; Thu,
 20 Feb 2025 10:56:48 -0500
X-MC-Unique: sdXqK49zNmOevyODIKQC8g-1
X-Mimecast-MFC-AGG-ID: sdXqK49zNmOevyODIKQC8g_1740067006
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BACB3180087C;
	Thu, 20 Feb 2025 15:56:45 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.33.76])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B57431801381;
	Thu, 20 Feb 2025 15:56:38 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: nicolas.dufresne@collabora.com,
	cohuck@redhat.com,
	hverkuil@xs4all.nl,
	adelva@google.com,
	gnurou@gmail.com,
	eballetb@redhat.com,
	mst@redhat.com,
	ribalda@google.com,
	changyeon@google.com,
	mvaralar@redhat.com,
	daniel.almeida@collabora.com,
	dverkamp@chromium.org,
	agordeev@qti.qualcomm.com,
	gurchetansingh@google.com,
	alex.bennee@linaro.org,
	Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v7 0/1] virtio-media: Add device specification
Date: Thu, 20 Feb 2025 16:56:35 +0100
Message-ID: <20250220155636.577400-1-aesteve@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HKVowH2fo1UMYqkiXVCA3-1Sv7dJcplwHw0FDlvJ4yo_1740067006
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

New attempt of including virtio-media
device specification.

v6->v7:
- All uses of must referencing
  driver or device, put into a
  normative section accordingly.
- Switched 'can' with 'may' in
  a couple of appearances.
- Clarified UUID memory layout
  for VIRTIO_OBJECT memory type.
- Fixed a typo in the driver
  normative document.

v5->v6:
- A couple minor typos.
- Change driver-writable for
  device-readable to avoid
  confusion.

v4->v5:
- Rewritten/clarified some parts
  according to the reviews received.
- Added missing links to V4L2
  structures. Structs should
  have a link on their first
  appreance in the document.
- Clarified memory type
  semantic V4L2 equivalent.

Virtio-media came from a discussion on virtio-dev
mailing list, which lead to presenting virtio-v4l2[1]
specification as an alternative to virtio-video.

Later, virtio-v4l2 was renamed to virtio-media[2]
and published at:

https://github.com/chromeos/virtio-media

The repository above includes a virtio-media driver able
to pass v4l2-compliance when proxying the vivid/vicodec
virtual devices or an actual UVC camera using the
V4L2 vhost device (available in the repository).
It also includes a FFmpeg-based video encoder
device. Steps to reproduce are also detailed[3].

Recently, virtio-media has landed in AOSP[4].
Also the driver patch has been sent to the
kernel, currently in its v2 [5].

Furthermore, virtio-media got a proposal to reserve
device ID 48, which was finally approved for
inclusion in v1.4.

There is some overlap with virtio-video in regards
to which devices it can handle. However,
they take different approaches, making them
the preferable choice for different scenarios.
Moreover, given that virtio-media will be the virtualization
solution for media devices for ChromeOS, Android, and
possibly others, this gives a justification for the desire
to include the specification in the next release despite
the aforementioned overlap.

Full PDF: https://drive.google.com/file/d/1CWWK6EP7AFkRKqcRGxesRDOXxb8NccJe/view?usp=sharing
PDF with the media section only: https://drive.google.com/file/d/1RkS7VlZLycdFOidsOHviTTBaTh-XOpu-/view?usp=sharing

[1] https://mail.google.com/mail/u/0?ui=2&ik=73ebd65ebd&attid=0.1&permmsgid=msg-f:1767388565327924962&th=1887068940754ee2&view=att&disp=inline&realattid=f_libalimc0
[2] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg12665.html
[3] https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md
[4] https://cs.android.com/android/platform/superproject/main/+/main:external/virtio-media/
[5] https://lore.kernel.org/lkml/20250201-virtio-media-v2-1-ac840681452d@gmail.com/T/

Albert Esteve (1):
  virtio-media: Add virtio media device specification

 conformance.tex                           |  13 +-
 content.tex                               |   1 +
 device-types/media/description.tex        | 637 ++++++++++++++++++++++
 device-types/media/device-conformance.tex |  15 +
 device-types/media/driver-conformance.tex |  11 +
 5 files changed, 673 insertions(+), 4 deletions(-)
 create mode 100644 device-types/media/description.tex
 create mode 100644 device-types/media/device-conformance.tex
 create mode 100644 device-types/media/driver-conformance.tex

-- 
2.48.1

