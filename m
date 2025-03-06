Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7547120A5D8
	for <virtio-comment@lists.linux.dev>; Thu,  6 Mar 2025 09:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741255130; cv=none; b=CqZwHfglPr5I0b8hefH9Xwh1dgF7SJX2zoBVFt6ohtXACV3gQFUCmy00ImJx1z5GsqUAo44rU11C5zBarMUmwC5SHIquLnqdPxLXxXARujW/yaY5wwHQeKPELF20krTu4YfUQ04uQJzyhEQjLpbg48GrsgWIDft0oUE0a4IdtKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741255130; c=relaxed/simple;
	bh=75FiD9q+Q1Iw9xQGv9unO0TQ3V3rX+n3EywodKBaQAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GQLjqehTHx5vc7IJK/Vy6CLvz7RYxtuBQpiBzIbSMFe3ThOWiFTxdiimDxYVEi34T9fn4qxu9DVjL1yYvWKpYaMHVvFMPUEcniBsDJLABiQ2ueGLN4fHrb8FOLstD28gcToCq7JkgqSIctQaz8YNup54Ode8/KyYf3mETolmOJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P5aIk2BD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P5aIk2BD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741255127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8TjuJ7RAwzVhvM9QHtl+UNCzTuxwgpEM/3+1IpYPAbI=;
	b=P5aIk2BD6Lpk8XoO5o3ui74wV2i4ExVhA0gVzv8xxtwmMVBLdPZ9sc/KMf6z25cS3p7+Qt
	/hRcCNNwd3g0gBCXH4IO5NGl1iZnB7+oorNSShZskklY7CSQzHWP96DhYTcYO6LuQmRbCR
	MA60CNMQgTavRg/x0Dir4NlGrQ+XehY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-I9GtmZLMMNqY6jH39TTw7A-1; Thu, 06 Mar 2025 04:58:41 -0500
X-MC-Unique: I9GtmZLMMNqY6jH39TTw7A-1
X-Mimecast-MFC-AGG-ID: I9GtmZLMMNqY6jH39TTw7A_1741255120
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43bd0586b86so3087535e9.3
        for <virtio-comment@lists.linux.dev>; Thu, 06 Mar 2025 01:58:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741255120; x=1741859920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TjuJ7RAwzVhvM9QHtl+UNCzTuxwgpEM/3+1IpYPAbI=;
        b=fXv5FHFwvoPdvgfMJrcqV35q9ojpZ6QigLW6Vx8ln43eatQPU722kt6yLG3Q1Y7X38
         DrkG1RPO/xFlHxXUB4dTk6PyRST2iIg/W1GWVoAh0+mFS7sxb2WExefYk6Z4SUdQ0/5D
         aM38swO8gQ6cfixEwRv/E/NWfeR4VO2SuxdS0MpfkbS4J9F9kV8z1yRULO6WLOgN6Ti6
         4SRptyQJitIm/WukxZhqYdQD/8UES7Von0MxwHQYK6Hw3jKtRSdGt7/Wbft6Xa62Ee2s
         FCsL5J0k+zbOltRE932FvU1x0j3h9WbMxeOdFcjQl7tYuq/ijRYr/apOutrdhXw0tpbq
         WLyA==
X-Forwarded-Encrypted: i=1; AJvYcCWbSxD/EBIdly3+X0mZ38+xoUer9n7d77IH0ESdH0qCGtNrcTHmAQ1e4rEHCOtVWmjSFa/JRxzri5W5vWM0tQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUJA3bUWztrxpqBMjdzd7bmtoQRnnkCoNifAg8JL/RpICQNZD8
	7a2hpSVKHs+2jcywNt4u5knti5q5JYP4UyJeguQ2rjpXXPHlJJxv5RGw0ij4FS2DuooPke1w+hI
	QO55X4NtcVqO/4CaCrPttF2DWjS1UkcCkoKAQKdGIc0wTwNwU8HU+gjelSQHO1+aP
X-Gm-Gg: ASbGncvelOf26XtCgPUXdoLtCfAlE3MAH0Wc0vVh14SG0oNeY9GDtPbosIiI+uL19+n
	Q7JvF/QXVyrq/pjoyDKI/XkmHW6vY8jlbxc833SYxLxtUHTUPyuoLbrL1FLKmrKGEzXlQV3PsxD
	ThqncB7Ra1pXzZhmAQKtDHxudUODL6uYWgZkCK1TeKC8qZkw77Ep7kO2+NPXzG26kRheIYXdczX
	57w7G9Z5z3/c/DdLcaPaaIoVyHmkt9fsSrBCWHgRVjYe4G7gP+rb+IduNiVV3eqBxY7yGDadZCF
	6n4eH/2puTYDjKtvQv8XMsKs9hAf7JY5e1w9/32M4R+2FuDHbaclr+0Ikb+Nshog
X-Received: by 2002:a05:600c:35d4:b0:43b:ccfe:eeee with SMTP id 5b1f17b1804b1-43bd296df70mr63095435e9.11.1741255119924;
        Thu, 06 Mar 2025 01:58:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/7xlpfUfKfELEXKmwJUo2L2DNwjfdQJXtJLro0owGwauWvhDA29PxcWujsV7yB9eJFXMXbA==
X-Received: by 2002:a05:600c:35d4:b0:43b:ccfe:eeee with SMTP id 5b1f17b1804b1-43bd296df70mr63095195e9.11.1741255119338;
        Thu, 06 Mar 2025 01:58:39 -0800 (PST)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8dbb2fsm14724475e9.20.2025.03.06.01.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 01:58:38 -0800 (PST)
Date: Thu, 6 Mar 2025 10:58:33 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>, 
	virtio-comment@lists.linux.dev, aesteve@redhat.com
Subject: Re: [PATCH v3] git-publish: add profile
Message-ID: <CAGxU2F6DBhLhEGmABm6RrR=mXh9iwScWoqWeV0BxejH97Yik1w@mail.gmail.com>
References: <20250305164546.1484029-1-mvaralar@redhat.com>
 <20250306052231.GE303194@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250306052231.GE303194@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: edK7iw6iodUKH-lCJt27bWg7VBzJn92qw7vjStNOC2w_1741255120
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, 6 Mar 2025 at 06:24, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Wed, Mar 05, 2025 at 05:45:46PM +0100, Matias Ezequiel Vara Larsen wrote:
> > Add git-publish profile and document how to use it.
> >
> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > ---
> > v2 -> v3:
> >    * remove uppercase and the line split and use italic
> > v1 -> v2:
> >    * add link to git-publish
> >    * document that the project contains a profile already
> > ---
> >  .gitpublish |  3 +++
> >  README.md   | 15 +++++++++++++++
> >  2 files changed, 18 insertions(+)
> >  create mode 100644 .gitpublish
> >
> > diff --git a/.gitpublish b/.gitpublish
> > new file mode 100644
> > index 0000000..d412896
> > --- /dev/null
> > +++ b/.gitpublish
> > @@ -0,0 +1,3 @@
> > +[gitpublishprofile "default"]
>
> Great, this will make it easier to send spec changes!
>
> > +base = master
> > +to = virtio-comment@lists.linux.dev
>
> From https://github.com/oasis-tcs/virtio-spec?tab=readme-ov-file:
>
>   When not to use the virtio-comment mailing list:
>     questions and change proposals for Virtio drivers and devices
>     implementing the specification. (please use the virtio-dev mailing
>     list for this).

That statement talks about the driver and device "implementing" the 
spec, not the spec itself, indeed there is another statement:

  When to use the virtio-comment mailing list:
     questions and change proposals for the Virtio specification,
     including the specification of basic functionality, transports and
     devices.

So I guess this patch is right, since here we are talking about spec 
changes.

BTW I'm honest, I'm always confused about virtio-comment and virtio-dev 
xD, so another "Thank you" to Matias for this patch!

>
> This also matches what I found in my .git/config where gitpublishto was
> set to virtio-dev rather than virtio-comment.

IIUC this is wrong, you should use virtio-comment for spec changes.

Thanks,
Stefano

