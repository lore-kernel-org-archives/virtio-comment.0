Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9932D442C
	for <virtio-comment@lists.linux.dev>; Tue,  4 Mar 2025 13:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741093312; cv=none; b=gRS1mGBVdfLa+YtfOjBVyB4J59Kple4u4ZVRVcJLUP5Gmk+7Sb4A1ORgEVNFFb55BDNYUFtV3CO2ipli2XdEkm8j2BwEqLTe6jZUuLmRAQbVydPQ/pFblF2XRJ9OTPYiL/54j571reFmhvBX/dBTIVq7rmuNR/BPDNyQ74cxaFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741093312; c=relaxed/simple;
	bh=St6DJ3QRuFnh+Cy2DgGLbxWbhfYK6iZo+yRVOMArhyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bvThKw2pdhWSgUajws2fMQGKGqARYncWFyFrS7p8zvxsh6aUa0L+BKnjn0jX3W0mMYabMgnGnrxiyP0wMI76PtvBh+jYQ53RIuWt0iN5+iRnzWHkMubCyBeShM/hFgdzBkoiO5xuXuJxAAgPMhsNgzwWvYqauBp//ON/meLcsy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A9HF7RqI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A9HF7RqI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741093309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H2HSh9lN9x9semupz3ZlmGtJABvcevLgxas8cstevRQ=;
	b=A9HF7RqINmL1TuZ07Lbod9JpDBit0E77K48aZAiQHcCdjgSjGe5ocPFWGrsc+6DNEs8rGY
	qdOKK4JEka3MMyNGf2zM9HfOegJPd3Ay4kyaujw9r4BBewPsSRl/qOvPPYFtrqkqum7yDx
	q0An7e0FvDDduqdmXpLwZlLx8QBUKB8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-358-_kV1blnPOLWjQk7FAYWpbQ-1; Tue,
 04 Mar 2025 08:01:46 -0500
X-MC-Unique: _kV1blnPOLWjQk7FAYWpbQ-1
X-Mimecast-MFC-AGG-ID: _kV1blnPOLWjQk7FAYWpbQ_1741093304
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AC7841954B20;
	Tue,  4 Mar 2025 13:01:43 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.34.87])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F0F2119560AB;
	Tue,  4 Mar 2025 13:01:36 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: nicolas.dufresne@collabora.com,
	cohuck@redhat.com,
	adelva@google.com,
	mvaralar@redhat.com,
	hverkuil@xs4all.nl,
	mst@redhat.com,
	dverkamp@chromium.org,
	gurchetansingh@google.com,
	alex.bennee@linaro.org,
	changyeon@google.com,
	daniel.almeida@collabora.com,
	agordeev@qti.qualcomm.com,
	gnurou@gmail.com,
	eballetb@redhat.com,
	ribalda@google.com,
	Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v8 0/1] virtio-media: Add device specification
Date: Tue,  4 Mar 2025 14:01:33 +0100
Message-ID: <20250304130134.1856056-1-aesteve@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PUV-sRVDs3VWKgVwzvYCv_nY1gdgZPESBoL1W9T0Wa8_1741093304
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

New attempt of including virtio-media
device specification.

v7->v8:
- Merged DQBUF and DQEVENT into the same
  item for unsupported ioctls
- Rewrote/clarified a couple paragraphs
  based on previous version reviews.

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

Virtio-media came from a discussion on virtio-dev
mailing list, which lead to Alex Courbot presenting
virtio-v4l2[1] specification as an alternative to
virtio-video.

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
to which devices it can handle. However, they take
different approaches, potentially making them
the preferable choice for different scenarios.
Furthermore, virtio-media has matured since it
was first presented, and there are public efforts
to have upstream driver and devices.

But mainly, given that virtio-media will be the virtualization
solution for media devices for ChromeOS, Android, and
possibly others, I think is important that it gets
standardized and included in the specification,
despite the aforementioned overlap.

Full PDF: https://drive.google.com/file/d/1sDZXWVlvPbHKKguhekCXMzkpNZZ0g3hV/view?usp=sharing
PDF with the media section only: https://drive.google.com/file/d/1JjOIzecnkFFlpFBRjPQEUyAOD3BDHAdw/view?usp=sharing

[1] https://mail.google.com/mail/u/0?ui=2&ik=73ebd65ebd&attid=0.1&permmsgid=msg-f:1767388565327924962&th=1887068940754ee2&view=att&disp=inline&realattid=f_libalimc0
[2] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg12665.html
[3] https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md
[4] https://cs.android.com/android/platform/superproject/main/+/main:external/virtio-media/
[5] https://lore.kernel.org/lkml/20250201-virtio-media-v2-1-ac840681452d@gmail.com/T/

Albert Esteve (1):
  virtio-media: Add virtio media device specification

 conformance.tex                           |  12 +-
 content.tex                               |   1 +
 device-types/media/description.tex        | 639 ++++++++++++++++++++++
 device-types/media/device-conformance.tex |  15 +
 device-types/media/driver-conformance.tex |  11 +
 5 files changed, 674 insertions(+), 4 deletions(-)
 create mode 100644 device-types/media/description.tex
 create mode 100644 device-types/media/device-conformance.tex
 create mode 100644 device-types/media/driver-conformance.tex

-- 
2.48.1

