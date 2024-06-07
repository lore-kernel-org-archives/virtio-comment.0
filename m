Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AC1198E8D
	for <virtio-comment@lists.linux.dev>; Fri,  7 Jun 2024 13:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717767328; cv=none; b=Nkehs+Xxjukr8SNUJsnDP3EekVuF9KIAYzdI/VWOW3YvDKEgW9GyuwJx3xc7+FBoC5MQ4PFhBWFOn+8cd1AnFyM1ztqGGG+JlyhQb5Na28+O0D9UcGTUrc9B3tCQGXHYuKr/WVrAG8MpdI575EDCiljesi7f2gHZeZs3QuENTX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717767328; c=relaxed/simple;
	bh=Xlk4mXe2Fxz5UvSWJixKm7sIPub509qf86+qjRTwdis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GtBiwuSy01ZmI5eJwOMetByrLjI/F73+Y0ilJ7u4wj4Rh6MvdPrGJsHIDxVv0+XFO7nyH0K+PJfIIQpq1CVClru+Ou82e1Ozp0yqGz+MYnrHjdczY2RnCpl+b7Mmw1GCEKS3DXkP7MNKJQUkiT+UqmHYBCS4ymxYGlgSbC5mxAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NgTyWLJl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NgTyWLJl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717767325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XBOTomXQHhehouihiYlMPswstXkGdWVhJP60nlQzi6A=;
	b=NgTyWLJl1k3DPZjZf3soTzxbWX9Bbv5SgNd0uNqRoNo9Ub56RXK2A1StkxMG87xMqZegWc
	hQg9PBZpXJizYpDEAUxmWbLceFd6QIhfKuL4M4w2DRevtKoyrS4bzJH3hqii87/APvx8BL
	paDEsVF58ju1X+dV3gcvott82H6U7Yc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-675-rJhEDBJdMtmiksxNwcZdJQ-1; Fri,
 07 Jun 2024 09:35:22 -0400
X-MC-Unique: rJhEDBJdMtmiksxNwcZdJQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9FC8719560AE;
	Fri,  7 Jun 2024 13:35:20 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.225.67])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4AC7E192D1F9;
	Fri,  7 Jun 2024 13:35:09 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: changyeon@google.com,
	eballetb@redhat.com,
	daniel.almeida@collabora.com,
	Alexander.Gordeev@opensynergy.com,
	ribalda@google.com,
	acourbot@chromium.org,
	mst@redhat.com,
	gurchetansingh@google.com,
	Matti.Moell@opensynergy.com,
	cohuck@redhat.com,
	nicolas.dufresne@collabora.com,
	alex.bennee@linaro.org,
	Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v2 0/1] virtio-media: Add device specification
Date: Fri,  7 Jun 2024 15:35:07 +0200
Message-ID: <20240607133508.1400529-1-aesteve@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Repost to fix the mailing list to which this is
sent to. Sorry for the noise.

Check previous thread here so that no responses
are lost:
https://lore.kernel.org/virtio-dev/b2abecb4-03a2-49ce-bfc3-2d95eb7a6956@opensynergy.com/T/#t

This an attempt of including virtio-media
device specification.

v1->v2:
- Remove naming host/guest in the text
- Explicitly specify endian-ness of the device
- Change address by offset in the MMAP operation
- Specify SHM region for MMAP operation

Virtio-media came from a discussion on virtio-dev
mailing list, which lead to presenting virtio-v4l2[1]
specification as an alternative to virtio-video.

Later, virtio-v4l2 was renamed to virtio-media[2]
and published through:

https://github.com/chromeos/virtio-media

The repository above includes a virtio-media driver able
to pass v4l2-compliance when proxying the vivid/vicodec
virtual devices or an actual UVC camera using the
V4L2 vhost device (available in the repository).
Steps to reproduce are also detailed[3].

There is some overlap with virtio-video in regards
to which devices it can handle. However,
as virtio-media will likely be the virtualization
solution for ChromeOS (already landed into the chromeos
organization) and possibly other Google projects for
media devices, it would be desirable to include the
specification in the next virtio release despite
the aforementioned overlap.

The device ID in this document differs from
the ID in the virtio-media project repository.
And it will probably need some discussion on which
would be the correct definitive ID.

Full PDF: https://drive.google.com/file/d/1pNCFP06VoV8Zuyx0aDVQ7HAT4xp-pZ0a/view?usp=sharing
PDF with the media section only: https://drive.google.com/file/d/1sn3NUUeCm46zVyJKHkpytTIgGw1fUt5T/view?usp=sharing

[1] https://mail.google.com/mail/u/0?ui=2&ik=73ebd65ebd&attid=0.1&permmsgid=msg-f:1767388565327924962&th=1887068940754ee2&view=att&disp=inline&realattid=f_libalimc0
[2] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg12665.html
[3] https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md

Albert Esteve (1):
  virtio-media: Add virtio media device specification

 conformance.tex                           |  13 +-
 content.tex                               |   1 +
 device-types/media/description.tex        | 578 ++++++++++++++++++++++
 device-types/media/device-conformance.tex |  11 +
 device-types/media/driver-conformance.tex |   9 +
 5 files changed, 608 insertions(+), 4 deletions(-)
 create mode 100644 device-types/media/description.tex
 create mode 100644 device-types/media/device-conformance.tex
 create mode 100644 device-types/media/driver-conformance.tex

-- 
2.44.0

