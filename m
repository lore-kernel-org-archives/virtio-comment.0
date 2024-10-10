Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D265F26AFC
	for <virtio-comment@lists.linux.dev>; Thu, 10 Oct 2024 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728578130; cv=none; b=t+Uzheuj8R3OUXAMUgHSO3xvxeD9jmIp0rk0TJLccciLaIOBf6ArMqfTlCb5F3UlgaPWi1szfAddfFQaGCTWK9cFdnNRgiwvFOm4g2zRpN9O8O8LvH03lc+V4byXxtC3UwkvOdEcY4akoBgvTdCGQtzLr34z685eksrfsdHeLt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728578130; c=relaxed/simple;
	bh=5Af0wgR+IqA81rSxkhX/GL5C+oE+YEgHwoEy/xSs6BA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m8TIc1xYZuDIq38f0bAb5AcuW1EigjI+cIMa11PyewKsARH3JHK0h+tYGk0Y8t7aIYuzsvOA0FbZO5VnQLAf7XVVGlKCQ9ZE/5z2887enYj5vUdwRd3ErPPWOijx9ACJ1irPM5AUZFWxZeBwjTErPxaBSCXXknFSOBjX+UAweWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vdn4NGZK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vdn4NGZK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728578127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=ttniol62q8KM/IyCen+4PBff48IuXkTXOSilQ7wM3r0=;
	b=Vdn4NGZK5uv/9oA2iDFRUA3m7UtQRs6rHo6uAeihgkwbN3P/XifrhpdWpeUGF8hsAGUhgE
	IyX0AG8C1+cPpdOy0WhcuJ9arFwkrX/H6V+w6yKCVZDkhRsoxfqfsSDFaswr3HXDBkoE0+
	ERbYArMjzZ7FyBkCBbT0SWJDeY25WXI=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-1bsv9EUkOk2JB4Nj0_JoQg-1; Thu, 10 Oct 2024 12:35:26 -0400
X-MC-Unique: 1bsv9EUkOk2JB4Nj0_JoQg-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5399687ac2cso1102418e87.3
        for <virtio-comment@lists.linux.dev>; Thu, 10 Oct 2024 09:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728578124; x=1729182924;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttniol62q8KM/IyCen+4PBff48IuXkTXOSilQ7wM3r0=;
        b=FMAfctiE/yQrBzB2mcU0QnAZHl3iGTfY7SOw1M5Qa/CHHjFBKt30NJLR5B9JnEaVls
         81opujOwtmTK0DOw/Rl8P9+aCpzG7v09aeKbbKBI/TzoSk4B3GAf7k9vK/H46xBsZOn7
         NDpFBtnV+PzWqxnBR7WTxQuu7VtM/nMBJGJ1o3nJXwCbCAegZjqhBk5gMk1eeIrB5y1r
         uMCQ58XSoUDby1DuuRq3kuDCi3sJGBFDFZBg2MSqZdAJB5L0p3K5PuGG1KCxNT1XyE0V
         Itmc3DiexgKAJyfbp2VSY7aXC1b1kvcHFvITD1Cw0DtYkX+yiYsRq+PiUY/PgiqClASR
         P0jg==
X-Gm-Message-State: AOJu0Yw6vDCetTgbhhtT77WDWkBZ0+3ne4DUF0viRY7SNlhCgJOWZyuY
	A0uwYkpbX2q9q2OsKj1akfisW0ESzwrYUqvsuHLVQVwVyP32fqDGFKvJGXe1vy8wMiJlZu50MB8
	d4t/6XvlXjkkzLS1T2XTFjjyhrMvkfdx26VNCiB6mhnBF9FgxrqgHkSpYniB0zmB4rHvDmDg3qB
	QFiTN7AmVLPBgAw0kcOl93tZihBbiCTYISadmCjoYRaQ==
X-Received: by 2002:a05:6512:2809:b0:536:741a:6bad with SMTP id 2adb3069b0e04-539c489253bmr4684035e87.12.1728578124411;
        Thu, 10 Oct 2024 09:35:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuProCQmp3lpxFg0Y69POEDtEFYflzc6xw+G589r9Q/FLpwd/0ACyKeL9fPCd5X9cCwy7oDg==
X-Received: by 2002:a05:6512:2809:b0:536:741a:6bad with SMTP id 2adb3069b0e04-539c489253bmr4684016e87.12.1728578123841;
        Thu, 10 Oct 2024 09:35:23 -0700 (PDT)
Received: from redhat.com ([2a02:14f:17d:fb13:fd72:22f:64e2:b824])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b7edebfsm1916006f8f.98.2024.10.10.09.35.22
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 09:35:22 -0700 (PDT)
Date: Thu, 10 Oct 2024 12:35:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [mst@redhat.com: virtio TC: nominating additional co-editor and
 co-chair]
Message-ID: <20241010123439-mutt-send-email-mst@kernel.org>
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

The following was send to a virtio TC members-only list.
Copying here for the sake of transparency.

----- Forwarded message from "Michael S. Tsirkin" <mst@redhat.com> -----

From: "Michael S. Tsirkin" <mst@redhat.com>
Date: Thu, 10 Oct 2024 10:42:12 -0400
To: OASIS-virtio@connectedcommunity.org
Subject: virtio TC: nominating additional co-editor and co-chair
Message-ID: <20241010101823-mutt-send-email-mst@kernel.org>

Hello!
Two important roles in the TC are an editor and a chair.  Currently both
Cornelia Huck and me are editors and chairs.  With the volume of
contributions increasing, the current editors and chairs felt overloaded
and were looking to get help. After some internal discussion, and
reviewing contribution history, two candidates were proposed, the
description below.


Within the virtio TC, the chair is responsible for creating voting
ballots. Since the situation where the TC approved a spec change,
only to find there is an issue with the change later, is messy to
resolve, the chair is also responsible for reviewing patches
for functional correctness and clarify,
tracking TC discussion and making sure the change was reviewed
before the ballot starts.

Matias Ezequiel Vara Larsen has been active in reviewing multiple
contributions, and volunteered for a role on an additional co-chair.

The editor is responsible for submitting the approved changes into the
git repository.  Within the virtio TC, this also includes making
editorial fixes: fixing typos and such. The editor is also responsible
for making sure the result compiles into alternative formats (PDF,
HTML), compiling final revisions for public review (clean and redlined)
and release.

Parav Pandit has been active in making multiple such editorial
fixes, and volunteered for this role.


The fact that the new co-chair can not commit directly, while the new
co-editor can not start a vote directly, should serve to keep some
checks and balances in place, and allow the community to keep working
smoothly.

Finally, we might have overlooked someone active in patch review or making
editorial fixes. Feel free to reach out by a private message if you
feel you have been active in one of those roles and would like to
volunteer.

There's no limit on number of chairs or editors, we can add more.

For now, I started two ballots to approve the two nominations, if you are a voting member,
you will be able to find both ballots here:
https://groups.oasis-open.org/higherlogic/ws/groups/b3f5efa5-0e12-4320-873b-018dc7d3f25c/ballots
As a reminder, ballot participation is mandatory to maintain voting rights.
-- 
MST

----- End forwarded message -----

