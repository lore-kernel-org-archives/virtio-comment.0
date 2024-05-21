Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC27535B7
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 14:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716300710; cv=none; b=l703pqp41rvE/hnXPsi4aMEEbyBcDQWAPszR+u+vkmBP4hBgro1eLTXLPa41vUlrTHxKCHFh6TaFSo75HjZqbGMvX7y0xlgIOuEWXR0uBRBB2qBWo4oZ20Zm+Msn9915lQLEz78AY/v/v3oFc2YoIiJotrE7cEs7WAWOAZlCN5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716300710; c=relaxed/simple;
	bh=EB4f/jsGkLhfpHL9qITIECnWrksg/+SzdbVHXIMagtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ifa7Br0hiYdWpaCevUvzoYbEKRdn47lZmqVIl5j1cYUcu2pXuSYULyar/L8uCcRB1+ESIcA8pFKwqYHf7bJljugWwiuffh79JTz7emRQAs4ft5zGDrZD8EiID3xj2ZfKG4HEDynelql+a1hXpU0qAifo9De8m9H6Zvs60fRVWxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iCXGQc1I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iCXGQc1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716300707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=31jrVpIBbIDTPVOy19wboee1KFbvp5HdGtq/drkBdCA=;
	b=iCXGQc1Ik57w6+W3BCC6FoWIu/nKrrsxgV5aZQfpXwKeZOdFlrGrOIN1iYJ+Mwp6ZLJLpb
	heot67PNK1mCOwE4HXjSY6IbMiT01FNGN//IOlz6Fo0jIjOZZErdvupxP0/Baaq4CvEnWH
	Uu8XsC0SD8BmhmsNSDjnLE+3n0cSIBY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-7f7OEwM9PAiiispMhTr5eA-1; Tue, 21 May 2024 10:11:46 -0400
X-MC-Unique: 7f7OEwM9PAiiispMhTr5eA-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-794975e4dfdso10855585a.1
        for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 07:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716300706; x=1716905506;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=31jrVpIBbIDTPVOy19wboee1KFbvp5HdGtq/drkBdCA=;
        b=j5BKYg98mS12ocUMNNiIeTSfG0OR2n758nVCHUGtBSyhpqR67uDfXyFsCY/mqoH+8F
         qLI6wGPgfkCEKG16HfPSHm7Ae7loGVVBh35bIsMHgXUSq/zXQwv8IG0Zrt9qH3zWuu32
         3LefP9azeJP7GYxVtED3EWRVyGBWf+iNz5hP4a78b3i9WykmiQuQ4/aXvLn73CVGK7A4
         oDv9LkrAQboTLeLFTqzX1bXwskRMUiHydthVf0xqVEoxtIJNlNAnPENaZEoD/T9ESYIG
         LL2gDt9r6SObyPQPIfBw1OJgkBSN2RolACHNrOIQ0PZ13uVNfuiSwC4Au5ZlmZsIC3Zj
         byew==
X-Gm-Message-State: AOJu0Yy9+NwIdtC38dT8hduddOqXsENQQ6C1nDEsBiFDjxD8QK7RZ1t7
	bac2uZJjueAj41VupqZIJQ8PKfkq2UwCAe61lDLzon3pZYkPnBSrJKZA8O5sA8mS4fSsVIvuJ9N
	y+NlHJu4xQZyNBbGHtGwNSkJr0qyk4EYUxSXz0h0AJRBAyxb1ph/YhoIM5jXUjAFtqHIMMsQG8X
	Po8M28PgJTW48eYYiFPIOpIU1rYk+YkTQX6B3wePPo1nQpwbol4LA=
X-Received: by 2002:a05:6214:5092:b0:6aa:a63c:f5b3 with SMTP id 6a1803df08f44-6aaa63cf8e4mr94456026d6.25.1716300705801;
        Tue, 21 May 2024 07:11:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIQU1Bo204r1eTXN5Fe+M341ef8gmUHmQ18vWgAkuJxd5sdLzMhTdbyX8XMWW3czvwBo5VPw==
X-Received: by 2002:a05:6214:5092:b0:6aa:a63c:f5b3 with SMTP id 6a1803df08f44-6aaa63cf8e4mr94455766d6.25.1716300705418;
        Tue, 21 May 2024 07:11:45 -0700 (PDT)
Received: from fedora (lmontsouris-659-1-55-176.w193-248.abo.wanadoo.fr. [193.248.58.176])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a36423a92csm52082276d6.112.2024.05.21.07.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 07:11:45 -0700 (PDT)
Date: Tue, 21 May 2024 16:11:42 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: harald.mommer@opensynergy.com, mvaralar@redhat.com
Subject: [PATCH] virtio-can: define out of rage can-id
Message-ID: <ZkyrnsCXu8mQpDQI@fedora>
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
* This patch applies on top of virtio-1.4, which has not been released
  yet.
---
 device-types/can/description.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/device-types/can/description.tex b/device-types/can/description.tex
index 2511d9c..98b163b 100644
--- a/device-types/can/description.tex
+++ b/device-types/can/description.tex
@@ -191,6 +191,9 @@ \subsubsection{Controller Mode}\label{sec:Device Types / CAN Device / Device Ope
 invalid state with VIRTIO_CAN_RESULT_NOT_OK in \field{result} and MUST
 NOT schedule the message for transmission.
 
+Note that a message is out of range when a standard frame uses more than 11
+bits of \field{can_id} or when an extended frame uses more than 29 bits.
+
 If the parameters are valid the message is scheduled for transmission.
 
 If feature VIRTIO_CAN_F_CAN_LATE_TX_ACK has been negotiated the

base-commit: 37c6a406678a5ee891fdf5671298cb4fcfa517f2
-- 
2.42.0

