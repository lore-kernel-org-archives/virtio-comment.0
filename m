Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E3D19306C
	for <virtio-comment@lists.linux.dev>; Thu, 17 Oct 2024 07:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729148687; cv=none; b=L8BzQJxkHndWSilJTl6qnrsoW+fIADi5Tjvp1pVI0vl6+kTvdDmPQ1/sxsKGxi0b3tNPoW6PljJ+xl7SAuOtj9hTJnuF5YXfuQYxUG8r9WTs6mhywCQoezcYJgIpbB0KrL5GV7rnxxn7g+lb3m8JeVVmB1qVdZQsuZ15l04JE84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729148687; c=relaxed/simple;
	bh=+uoGWtbSuUFp5gOZGPWEjHqmCY9CAoxmzT1TgxlCPMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OpDnRjMszOG1xUMpzKUrJWeFdbNP63pi19pqAKQ6cFInftQrpKZ6GFiFoG8+ZV2xS/ACdtnmW9xo9PKkGnzlZDYlufLtpSxcSOt7i2LcA7cGyxaL+Of6mdthZWHHwW3yZTOXF8qF90hRndHNsYBC9Z+ASJ7IegQVSRFwwf0GFGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q/L1hMiX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q/L1hMiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729148683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ROh78gV05tWBOqcsfaOFXnhIi6TdNlW9YxOipv8GGsk=;
	b=Q/L1hMiXRy8147vkfvWFr5CcqkMRYBq943UPp7oDbnnIGyERocHfNg9rpDd+gpkCc+YULg
	KkGvj504aUdZnUYShpqiIb3exChyNF4titBDMyEtqG6TfsGbNYW314P9JfQsCfJzidJZGD
	8/x+pxqka75KtX2CC2zTXTeO76+HFtg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-657-dz5OrwonPmysL6jfWaU_7A-1; Thu,
 17 Oct 2024 03:04:39 -0400
X-MC-Unique: dz5OrwonPmysL6jfWaU_7A-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E78971956057;
	Thu, 17 Oct 2024 07:04:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.45.224.70])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 601B619560A3;
	Thu, 17 Oct 2024 07:04:31 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: changyeon@google.com,
	daniel.almeida@collabora.com,
	ribalda@google.com,
	nicolas.dufresne@collabora.com,
	alex.bennee@linaro.org,
	eballetb@redhat.com,
	acourbot@chromium.org,
	gurchetansingh@google.com,
	hverkuil@xs4all.nl,
	cohuck@redhat.com,
	mst@redhat.com,
	agordeev@qti.qualcomm.com,
	Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v3 0/1] virtio-media: Add device specification
Date: Thu, 17 Oct 2024 09:04:22 +0200
Message-ID: <20241017070423.86706-1-aesteve@redhat.com>
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

New attempt of including virtio-media
device specification.

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

Recently, virtio-media got a proposal to reserve
device ID 49, which was finally approved for
inclusion in v1.4.

There is some overlap with virtio-video in regards
to which devices it can handle. However,
they take different approaches, making them
the preferable choice for different scenarios.
Moreover, as virtio-media will likely be the virtualization
solution for ChromeOS (already landed into the chromeos
organization) and possibly other Google projects for
media devices, it is justified the desire to include
the specification in the next release despite
the aforementioned overlap.

Full PDF: https://drive.google.com/file/d/1zhmteCqkZsn-oQz5Gle2uG8HvDy1vGSw/view?usp=sharing
PDF with the media section only: https://drive.google.com/file/d/19A8RH-3kiOkod0xkHkuxCtoq0-PtuaQ4/view?usp=sharing

[1] https://mail.google.com/mail/u/0?ui=2&ik=73ebd65ebd&attid=0.1&permmsgid=msg-f:1767388565327924962&th=1887068940754ee2&view=att&disp=inline&realattid=f_libalimc0
[2] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg12665.html
[3] https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md

Albert Esteve (1):
  virtio-media: Add virtio media device specification

 conformance.tex                           |  13 +-
 content.tex                               |   1 +
 device-types/media/description.tex        | 583 ++++++++++++++++++++++
 device-types/media/device-conformance.tex |  11 +
 device-types/media/driver-conformance.tex |   9 +
 5 files changed, 613 insertions(+), 4 deletions(-)
 create mode 100644 device-types/media/description.tex
 create mode 100644 device-types/media/device-conformance.tex
 create mode 100644 device-types/media/driver-conformance.tex

-- 
2.47.0

