Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E32212D07
	for <virtio-comment@lists.linux.dev>; Thu,  7 Nov 2024 15:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730994593; cv=none; b=HAn0BYC1Dqgf0OCWU30Vx724CHeJepUVC0RrZpHIKMdyF+q7QEK8DImSNva3jAAf6LxDWQzyLXoHWU826GYttjf8A1zOT2bXJ+VnxMZX9m6eNV5CljyvogLLRyxpQNHJRlqHaU6ouForbnGNl++a57UDzVrxbIgmIF33BfblAzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730994593; c=relaxed/simple;
	bh=cZmlrKWIh0eZwgre/EgVmNA0/brAXm9FmOeMfpizEtg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LBfGQ0ogAV8/0qiIlRaGTAzP/7KTpubSx621aHXYUiyh20v/Pd3nFLNK71INM9jzZB5zyzgjhtZOBVYAQvDdjvCQs9Y9CYsCYwOyzbjUxsOghZmCVgVx2w3P/FZAtCQfwfyFhG+aIMJ9YBM/KR0lU59+K08C95wouvdLrgP75NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NKIRZgK6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NKIRZgK6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730994590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kqXzrKWvlqnwAxfbaDz4MZ5zqErNVgjY6ZxupypHlqw=;
	b=NKIRZgK6VIx9IWZq4GAlf90Nxs0m2hjcvFQCX5PXXOu9wABoFg22yrPWV+vVhVwlspyDvW
	X9BpZvOL0MEyVPWzPvqvbxrYD2F4RdJw8bD/Bz2hn6TYbcI8fTvMOCOFta5QdafGK50Ch6
	Fp8FbagAaRRtR8He0Ujp92yep5TBfVU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-613-GkV7f9KKM9yaNYux0QSjCQ-1; Thu,
 07 Nov 2024 10:49:47 -0500
X-MC-Unique: GkV7f9KKM9yaNYux0QSjCQ-1
X-Mimecast-MFC-AGG-ID: GkV7f9KKM9yaNYux0QSjCQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD1671956077;
	Thu,  7 Nov 2024 15:49:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.45.224.140])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8EFF03003B71;
	Thu,  7 Nov 2024 15:49:39 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: eballetb@redhat.com,
	daniel.almeida@collabora.com,
	agordeev@qti.qualcomm.com,
	dverkamp@chromium.org,
	ribalda@google.com,
	alex.bennee@linaro.org,
	mst@redhat.com,
	nicolas.dufresne@collabora.com,
	acourbot@chromium.org,
	cohuck@redhat.com,
	changyeon@google.com,
	hverkuil@xs4all.nl,
	gurchetansingh@google.com,
	Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v4 0/1] virtio-media: Add device specification
Date: Thu,  7 Nov 2024 16:49:29 +0100
Message-ID: <20241107154930.118763-1-aesteve@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MJO_jpCVTEllKD2l4KtbHcEdkNlaVnrHd0_XSymuP3o_1730994586
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

New attempt of including virtio-media
device specification.

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
media devices, it is justified the desire to include
the specification in the next release despite
the aforementioned overlap.

Full PDF: https://drive.google.com/file/d/13es8492vk2ZSYCwVcGt1qGs6uLvESvoo/view?usp=sharing
PDF with the media section only: https://drive.google.com/file/d/1cILB6mKSyWVs2yGs_WKfMpp1PSDOFPp4/view?usp=sharing

[1] https://mail.google.com/mail/u/0?ui=2&ik=73ebd65ebd&attid=0.1&permmsgid=msg-f:1767388565327924962&th=1887068940754ee2&view=att&disp=inline&realattid=f_libalimc0
[2] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg12665.html
[3] https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md
[4] https://cs.android.com/android/platform/superproject/main/+/main:external/virtio-media/

Albert Esteve (1):
  virtio-media: Add virtio media device specification

 conformance.tex                           |  13 +-
 content.tex                               |   1 +
 device-types/media/description.tex        | 575 ++++++++++++++++++++++
 device-types/media/device-conformance.tex |  10 +
 device-types/media/driver-conformance.tex |   8 +
 5 files changed, 603 insertions(+), 4 deletions(-)
 create mode 100644 device-types/media/description.tex
 create mode 100644 device-types/media/device-conformance.tex
 create mode 100644 device-types/media/driver-conformance.tex

-- 
2.47.0

