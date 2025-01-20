Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96857E1
	for <virtio-comment@lists.linux.dev>; Mon, 20 Jan 2025 08:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363040; cv=none; b=ifVH3T8aebL8oqQaoUmKvoyCsnJl5uelfhe1c1dRbcqSjz4MYydn5dPaJAOVxazBPT0340ucr9YmtfztamoGV63VxzmwpH5+X0sI4i8gbMlVqfjRXe0S9YkhfTpp5KceaZCIlaUlWp6J3GWgOR4pxPmY23SAM7TWQpzbQFbpLm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363040; c=relaxed/simple;
	bh=dwsww7+8DT2iuUYb8pU1HyCOi02GjTf32FuLgE4kyKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qvk45SEUq4hpLQw98MulnI/qdAYLxbu4SfcEXOrQem2ZA0GApslaLdvuEjffEKRzSKAOGd+DymWQ2K9W9q3/XW4HxsUyl667JiR85GlvjOzSBo7Trv1BMtjVwg059Gec76pmJo/hnTup3UoYS3wt9ffijaQg798kkyv5LSuqb8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TkxAEvn6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TkxAEvn6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737363037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MciZ4KR8TITHL51HPHlfeFvIIWlXsQ6EBIsbf1HF+OE=;
	b=TkxAEvn6jl1Y7M6Hy4QvZvhuoUekIp02kp6mGp8kpqdnOdjI2JWgoW719OxRslVhtnexDL
	aLAhQu1T1HSzvnt7kLVu8P20b8TGaocwx/vEKIhMh+POPfkfiqp4RfZyOQWYJaGiHdJkPw
	mt1QDKMpVjlnLT1BuBh4a40hDSniZG4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-61-J_SnSWT3MWCSW1aZbk6bQQ-1; Mon,
 20 Jan 2025 03:50:34 -0500
X-MC-Unique: J_SnSWT3MWCSW1aZbk6bQQ-1
X-Mimecast-MFC-AGG-ID: J_SnSWT3MWCSW1aZbk6bQQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA641195F169;
	Mon, 20 Jan 2025 08:50:28 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.45.224.229])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 32A9819560A7;
	Mon, 20 Jan 2025 08:50:21 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: agordeev@qti.qualcomm.com,
	ribalda@google.com,
	acourbot@chromium.org,
	gurchetansingh@google.com,
	cohuck@redhat.com,
	daniel.almeida@collabora.com,
	changyeon@google.com,
	nicolas.dufresne@collabora.com,
	eballetb@redhat.com,
	dverkamp@chromium.org,
	hverkuil@xs4all.nl,
	mst@redhat.com,
	alex.bennee@linaro.org,
	acourbot@google.com,
	Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v5 0/1] virtio-media: Add device specification
Date: Mon, 20 Jan 2025 09:50:14 +0100
Message-ID: <20250120085015.956057-1-aesteve@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rx5A8dTFb38Ip1t9dkOf8eTAIE7NrrHgNfLoOZLWEJ8_1737363032
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

New attempt of including virtio-media
device specification.

v4->v5:
- Rewritten/clarified some parts
  according to the reviews received.
- Added missing links to V4L2
  structures. Structs should
  have a link on their first
  appreance in the document.
- Clarified memory type
  semantic V4L2 equivalent.

v3->v4:
- Updated device ID to 48
  (moved to the first free id)
- Specified endianess on all
  structures defined through
  the spec (leXX)
- Slightly improved the explanation
  of the size (and endianess)
  of the exchanged v4l2 structs
  as part of the ioctl command
  payload
- Changed cmd_mmap offset size to
  match the V4L2_QUERYBUF offset field
- Fixed most comments on previous
  version for small typos/rewrites.

v2->v3:
- Updated device ID to 49
- Renamed virtio memory types so that
  they are differentiated from V4L2
  memory types
- Memory types description slightly
  rewritten, explicitely excluding
  USERPTR support for guest userspace

v1->v2:
- Remove naming host/guest in the text
- Explicitly specify endian-ness of the device
- Change address by offset in the MMAP operation
- Specify SHM region for MMAP operation

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

Furthermore, virtio-media got a proposal to reserve
device ID 48, which was finally approved for
inclusion in v1.4.

There is some overlap with virtio-video in regards
to which devices it can handle. However,
they take different approaches, making them
the preferable choice for different scenarios.
Moreover, as virtio-media will likely be the virtualization
solution for ChromeOS, Android, and possibly others, for
media devices, this justifies the desire to include
the specification in the next release despite
the aforementioned overlap.

Full PDF: https://drive.google.com/file/d/1XKpPDalkXcJe2ZjPpbtiOcgJRIWy-UTf/view?usp=sharing
PDF with the media section only: https://drive.google.com/file/d/1fzvKEuY31vUF7ctQ0KK0CmfrDO5CdRFj/view?usp=sharing

[1] https://mail.google.com/mail/u/0?ui=2&ik=73ebd65ebd&attid=0.1&permmsgid=msg-f:1767388565327924962&th=1887068940754ee2&view=att&disp=inline&realattid=f_libalimc0
[2] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg12665.html
[3] https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md
[4] https://cs.android.com/android/platform/superproject/main/+/main:external/virtio-media/

Albert Esteve (1):
  virtio-media: Add virtio media device specification

 conformance.tex                           |  13 +-
 content.tex                               |   1 +
 device-types/media/description.tex        | 617 ++++++++++++++++++++++
 device-types/media/device-conformance.tex |  12 +
 device-types/media/driver-conformance.tex |  10 +
 5 files changed, 649 insertions(+), 4 deletions(-)
 create mode 100644 device-types/media/description.tex
 create mode 100644 device-types/media/device-conformance.tex
 create mode 100644 device-types/media/driver-conformance.tex

-- 
2.47.1

