Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7743543ACB
	for <virtio-comment@lists.linux.dev>; Thu,  6 Jun 2024 16:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717692692; cv=none; b=b2IBnko4AnPVJDr7EUdE3KG+hX4vVOjebm2Mpew6xC0Jfa6MSP0hILmDWhYv+0bp21pzhKlJLbb1FZJngs/DdlCkXLY5XCObAbxW+JWDv0GCSFJR1r+dGe5h62GYMGs0bYGBYFTRyS2mfdDGSH4pNbT42i/XaR4fP9Ql93gpIV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717692692; c=relaxed/simple;
	bh=91Qfc7mT+t3cy4vfLbd6KztDoFLRvzr/jeVZSiEGL3E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WciQ3EkTU7TTTds+dDRU7tEuIpD7eAl/ogr2zfNCAC/vS7+SA1F3NRFBUarBoINxvF/7MFd625tp93FotPTXH0YwLYwAOgOvNmVsWg8dkVzHBCykK8KqL91DBJsQj/t0jZgN/jD7ih7HekbCErCrEJDapa78Sjc69kmX9VRwt/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=blKftxzu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="blKftxzu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717692689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=91Qfc7mT+t3cy4vfLbd6KztDoFLRvzr/jeVZSiEGL3E=;
	b=blKftxzubgJ04J2KWyVP7apzbouhnEoY65AE5mR31FgWfNgOdqTxTZ1m+QqHBKThLIOItJ
	p9q/9iQRR6uAV1E9gojUaeIex9Y9zFAiVFCTZ/NZvzCdZbWv+8qmVhvFTjqG/Wyc4BXJb+
	rWSuj1a79aPp3akXY/+nhrnbsV+6ysU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-3U9NvS_jOG26D0soXoIGwg-1; Thu, 06 Jun 2024 12:51:28 -0400
X-MC-Unique: 3U9NvS_jOG26D0soXoIGwg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C33E5185B946
	for <virtio-comment@lists.linux.dev>; Thu,  6 Jun 2024 16:51:27 +0000 (UTC)
Received: from localhost (unknown [10.39.194.210])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C5D2492C29;
	Thu,  6 Jun 2024 16:51:26 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: ballot system back on
In-Reply-To: <20240606082035-mutt-send-email-mst@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20240606082035-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Thu, 06 Jun 2024 18:51:24 +0200
Message-ID: <87ed9akoab.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Thu, Jun 06 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> So, things seem to be working, even if they are
> now a bit harder to set up.
> Let's start wrapping up 1.3?
> I think we need to pack up and then do a ballot to ask OASIS to get a
> special majority vote for us.
>
> Right? Cornelia, want to start that?

I've now created a ballot to request a special majority vote; please
double-check whether I got the incantations right.

And because all that work is not really visible: Thank you for getting
those ballot scripts working with the new platform! This looks really
painful and time consuming...

