Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3236A1898F8
	for <virtio-comment@lists.linux.dev>; Wed,  5 Feb 2025 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738769711; cv=none; b=V0McUMNe0ylr1rj/8aKWdcS47BQ4dFsxZJFX27U9PyJY7sebswuF6Qa2u5EyBdA5DqyHFQun1WRKDwxR6uplMHldpRvvyxLY3byR+jI3gKmEhJxA3DGCPv1Ymm2gHFG1uOCN1ZNIGnCl8fI/uuUBrUYRrKItN4hn2nBDMxZaMwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738769711; c=relaxed/simple;
	bh=FEXkcQtFYJFR9UzxWdalo16F1lh1cJXjK8rE4+4hQC8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ML0SMFSeaGnQGJwb/o+6mEs6yAgeDbdmqzsOayQrcBPAatPyHpM23FLsNq/r/fShH0luVj11QExYA5ZWLn5dU4sh60ifZ0eORc1fO3mlXF0LGB957qL8LJlslZE0wjDTUprVSoOa02wV7l66DwGMjoVBHj8i28dVYOuCJItbcQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ii0MHG9G; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ii0MHG9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738769708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qlL6VzHP8lUuA6NvgQnRyLU7e0UCanhHBp96tmjStmA=;
	b=Ii0MHG9GzfLlDwutKIJ4BZNQP+wu0xLxNYnovKo2DIE3wLRpemU9H0ccgHeQ0A+JpIWFXN
	S9YhELyp6OvnV+o0sGq55l2ohAuxxGDizgGMq+YXca2QW1wbUnG7Zm92JzPfUSa/blt0+2
	gBUHTm1OqrI7ojdoP18jHZzTF/bpWHc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-441-O_02KtHkOhONi0cAaUjo6w-1; Wed,
 05 Feb 2025 10:34:18 -0500
X-MC-Unique: O_02KtHkOhONi0cAaUjo6w-1
X-Mimecast-MFC-AGG-ID: O_02KtHkOhONi0cAaUjo6w
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 388E7180087A;
	Wed,  5 Feb 2025 15:33:10 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.224.134])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9903719560A3;
	Wed,  5 Feb 2025 15:33:03 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: eballetb@redhat.com,
	adelva@google.com,
	gnurou@gmail.com,
	cohuck@redhat.com,
	daniel.almeida@collabora.com,
	ribalda@google.com,
	dverkamp@chromium.org,
	agordeev@qti.qualcomm.com,
	alex.bennee@linaro.org,
	nicolas.dufresne@collabora.com,
	gurchetansingh@google.com,
	mvaralar@redhat.com,
	changyeon@google.com,
	hverkuil@xs4all.nl,
	mst@redhat.com,
	Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v6 0/1] virtio-media: Add device specification
Date: Wed,  5 Feb 2025 16:33:00 +0100
Message-ID: <20250205153301.133040-1-aesteve@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UyHw6N4lP3TI-QHPQNw6pI3cdZbBf8mQcrtU7nZa_uA_1738769604
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

New attempt of including virtio-media
device specification.

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

Full PDF: https://drive.google.com/file/d/1baz3NZFPVEJlyprErUqevs38oPbjp1z2/view?usp=sharing
PDF with the media section only: https://drive.google.com/file/d/1AfYPnjHhh9rsfwQK0PKKbkM6sNlLV0UI/view?usp=sharing

[1] https://mail.google.com/mail/u/0?ui=2&ik=73ebd65ebd&attid=0.1&permmsgid=msg-f:1767388565327924962&th=1887068940754ee2&view=att&disp=inline&realattid=f_libalimc0
[2] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg12665.html
[3] https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md
[4] https://cs.android.com/android/platform/superproject/main/+/main:external/virtio-media/
[5] https://lore.kernel.org/lkml/20250201-virtio-media-v2-1-ac840681452d@gmail.com/T/

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
2.48.1

