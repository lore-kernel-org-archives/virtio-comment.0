Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A74D1D5150
	for <virtio-comment@lists.linux.dev>; Wed,  9 Jul 2025 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752053718; cv=none; b=EDSUG293aNodTqF3x7MDuYtNRzPS9Ow4dX+xqGmhK5LmjD38f7PhsStv94OPehlZCunbg+FZDtdEPalo3u9/+cUMPIoKstus2iXVqFpeTG8x67adzobPPENtCUEyg6GaAALZZIPIyeHCivcAqc3nwKz/4LbZN0C79GlciAOAQOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752053718; c=relaxed/simple;
	bh=MXmaDz2hLJASCw8U+Ylxy87cRYIZvF0hcV4zxfqKUjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D8p2SUOxdH+mHWLSCE8B1A/0zOcVlkuGdzjDgsTjbZK22mpME/VGVNW/9APi2al4dIu/gyH18O4CEQNnks2JXB6YgdNPHS32LRBtBYMQjq/qXUim+haxm58d6+l8CnUGTkmmpeOQKfGqKdvT4kYD6FQeUeimfnMDuLVaQ3l39Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bDuUZUeb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bDuUZUeb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752053716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gg7+B8rua0QGhoIPgsX/PJ35lwQgmzDxaYoUDBdK+qM=;
	b=bDuUZUebgWbPeJZad1BDLVM8kMc7g3wCE93C1RLByUovILw6ylD4HDwzfk0qjvOmyeJ/Mf
	J22XZg0aDCP94S5sDTsqtAtcjLwtbybiS1TMr4nrUF5G/bAh/hnyKurnUDgBj2oLnz13kZ
	QxMgE8Ks8zn67eU3KQ7wZNaCsvFjTeE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-5L4CVV0cM3GYamSh5ed1GQ-1; Wed,
 09 Jul 2025 05:35:13 -0400
X-MC-Unique: 5L4CVV0cM3GYamSh5ed1GQ-1
X-Mimecast-MFC-AGG-ID: 5L4CVV0cM3GYamSh5ed1GQ_1752053711
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D5E6D1956048;
	Wed,  9 Jul 2025 09:35:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.33.8])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 730341803AF2;
	Wed,  9 Jul 2025 09:35:03 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: ribalda@google.com,
	alex.bennee@linaro.org,
	adelva@google.com,
	cohuck@redhat.com,
	mvaralar@redhat.com,
	hverkuil@xs4all.nl,
	gurchetansingh@google.com,
	daniel.almeida@collabora.com,
	changyeon@google.com,
	acourbot@google.com,
	mst@redhat.com,
	eballetb@redhat.com,
	agordeev@qti.qualcomm.com,
	gnurou@gmail.com,
	dverkamp@chromium.org,
	nicolas.dufresne@collabora.com,
	Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v9 0/1] virtio-media: Add device specification
Date: Wed,  9 Jul 2025 11:34:55 +0200
Message-ID: <20250709093456.350242-1-aesteve@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pw_mWrUX70F3fu0yFgc6sb1ZpwAmVnjdlb_HK2q2eNE_1752053711
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

New attempt of including virtio-media
device specification.

v8->v9:
- Rebased to virtio-1.4

v7->v8:
- Merged DQBUF and DQEVENT into the same
  item for unsupported ioctls
- Rewrote/clarified a couple paragraphs
  based on previous version reviews.

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

 conformance.tex                           |   6 +
 content.tex                               |   1 +
 device-types/media/description.tex        | 639 ++++++++++++++++++++++
 device-types/media/device-conformance.tex |  15 +
 device-types/media/driver-conformance.tex |  11 +
 5 files changed, 672 insertions(+)
 create mode 100644 device-types/media/description.tex
 create mode 100644 device-types/media/device-conformance.tex
 create mode 100644 device-types/media/driver-conformance.tex

-- 
2.49.0

