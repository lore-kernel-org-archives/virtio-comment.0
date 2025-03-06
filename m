Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB8420A5F0
	for <virtio-comment@lists.linux.dev>; Thu,  6 Mar 2025 10:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741257835; cv=none; b=ZP/+6Oq76cXpDZ1kCgvSxHQX067VZSMnSpDqC9pFZ1wc3vJnaDwjuc7aQmymtH7aLbPDj2GaufkePzD6RBaUibym8WOISK1a3q6/tTPKH/KysyYtOXjnMF+qgPF+yXkWv6svviqHgBalpPJ0yIFj50tSLIsuTV9qUNVTuyJIGrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741257835; c=relaxed/simple;
	bh=NUGF+izb4Zt0tf7uydA0oCVwy87jpWBWUE+EyqIA0U0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fmwRaEZtnH3doNKCf947AyRB5ocNY18IBDLxEn4xXFEwG7PG2OPfMND7DZDbZA9B15/96bVjFr8+kI14DhvltGKsrlh8JYpzxHE5gvlEmswQNHYeeCLnZX5QFDfYDQmyQW9+TfWcMquK1Ol54UlsKokg1eEcHqaL6io3/NOnTPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dhCEWRKf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dhCEWRKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741257832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YsKLPTIAUfhwzZj7QUP9etNruBdOEnd/v2455faOI6Q=;
	b=dhCEWRKfvUmEpxXlESo6d0xN1FSuBCUwMCQDLDLXRW414Ikrz8aTCVgzHhOld416a/cAz+
	P/4gajm3ILq/Rdo4UlVYrmvczZo/kqYs5vFA06Cvb9pJX6T7eLW0fZ2JxFxe5f/hxlyHNY
	bNAMCKJnpM8zjoiI3AsUJHYtd6snAVg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-rSKD1yVoMZSb-hFyuMd75w-1; Thu, 06 Mar 2025 05:43:45 -0500
X-MC-Unique: rSKD1yVoMZSb-hFyuMd75w-1
X-Mimecast-MFC-AGG-ID: rSKD1yVoMZSb-hFyuMd75w_1741257825
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fe870bc003so1132314a91.1
        for <virtio-comment@lists.linux.dev>; Thu, 06 Mar 2025 02:43:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741257824; x=1741862624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsKLPTIAUfhwzZj7QUP9etNruBdOEnd/v2455faOI6Q=;
        b=E2CjvoGrroPUxtFtEH1cdJUshm90kQPo7RJlB8v/d1gjf4Z7lSUBUnw9pJ0FsoqG1V
         xm2S3p0QilSXvw5cSwpH60T0xGjKn07Xei5Ye2Aw0uOfx9h+w7BoW1pGhbVmK+sDF/YA
         kim2nm1MtzfIqjf+n6d9T6LnWWyda2A6EakbGJqlyRaVQzZ8t1HASeZ4CZ8cIIlLVAvo
         598yM6NORJG7n46sv58Yn9/Ov5aNncMnQi74ojb8NrsJ859FKEO5pUs4504smLItWpMc
         4qeoH9tYZ5cLLeIGJfJGLtEoewQ0aaA61GGxkIp9SiC2BMSOpfKT1+WeRaLdN4eu99Zt
         MB8g==
X-Forwarded-Encrypted: i=1; AJvYcCWrJ7Wd7CvFgaKcsM5ZgtIPPG5gSla1bPU/CEANQljUTpBh60EkAO/L5542+NNbDo12vR8qq2fp/VkjtRTgmg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxG005BhOF+2PUWDS6qCH/Ss706qJ2cb0kxyEmQ4RSQkog2lwXq
	hQDKyDS/mJT3RkCVs3fUE22ZU7qguLfIvborNuwmqaSvmIYYF2vUKpEUgE5yX00Izq9v6xbdhiq
	brWHqRrS2Z+q9c5cdiC1voKHPpBBUslXibbmmM/XYcaKFR0qVeOF3H18sppNpfx6KUIVCCs3pba
	d8TJF4ueILfW+Wn3pwo7hEdSUboySoEhppaYEiXbE=
X-Gm-Gg: ASbGncvlLdEW7S8ljGqW2ZjjPgLCcTx4vFaAr6ffFFWDSIi/pMy/hnQqhTZ7ea2xwIe
	sVdFisZwukupdL8PF0/0D8JO9lU26O/Bhi/seuKIyc1SKwXBYiLeFOV2wZATGSDb+2w99tqsKrX
	E=
X-Received: by 2002:a17:90b:1a92:b0:2fa:1e56:5d82 with SMTP id 98e67ed59e1d1-2ff617d4c26mr4505856a91.17.1741257824596;
        Thu, 06 Mar 2025 02:43:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCTaZJ6FasQOx+DWv6sfrHPgyRnD7GuxJerCD6SyPbQpi8ngk1qsb/+t2l4r52HR4fQa8t0i1IiuvEE8wWMtU=
X-Received: by 2002:a17:90b:1a92:b0:2fa:1e56:5d82 with SMTP id
 98e67ed59e1d1-2ff617d4c26mr4505830a91.17.1741257824091; Thu, 06 Mar 2025
 02:43:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250305164546.1484029-1-mvaralar@redhat.com> <20250306052231.GE303194@fedora>
 <CAGxU2F6DBhLhEGmABm6RrR=mXh9iwScWoqWeV0BxejH97Yik1w@mail.gmail.com>
In-Reply-To: <CAGxU2F6DBhLhEGmABm6RrR=mXh9iwScWoqWeV0BxejH97Yik1w@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 6 Mar 2025 11:43:32 +0100
X-Gm-Features: AQ5f1JqbBCR5lU52BYIrjanbbAjyT7IlHi-_S_mPxq8F55ZdJ3LJQjiTgvFrWzo
Message-ID: <CADSE00J+NDzOLx6yYsM1BcfCpwDa=BL22sYLG9A-RFww_aNEMw@mail.gmail.com>
Subject: Re: [PATCH v3] git-publish: add profile
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Matias Ezequiel Vara Larsen <mvaralar@redhat.com>, 
	virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c8NVf82MUgckp8O4Ek_kEXz-aDilVXQ9J-jqO-EFxxw_1741257825
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 10:58=E2=80=AFAM Stefano Garzarella <sgarzare@redhat=
.com> wrote:
>
> On Thu, 6 Mar 2025 at 06:24, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > On Wed, Mar 05, 2025 at 05:45:46PM +0100, Matias Ezequiel Vara Larsen w=
rote:
> > > Add git-publish profile and document how to use it.
> > >
> > > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > ---
> > > v2 -> v3:
> > >    * remove uppercase and the line split and use italic
> > > v1 -> v2:
> > >    * add link to git-publish
> > >    * document that the project contains a profile already
> > > ---
> > >  .gitpublish |  3 +++
> > >  README.md   | 15 +++++++++++++++
> > >  2 files changed, 18 insertions(+)
> > >  create mode 100644 .gitpublish
> > >
> > > diff --git a/.gitpublish b/.gitpublish
> > > new file mode 100644
> > > index 0000000..d412896
> > > --- /dev/null
> > > +++ b/.gitpublish
> > > @@ -0,0 +1,3 @@
> > > +[gitpublishprofile "default"]
> >
> > Great, this will make it easier to send spec changes!
> >
> > > +base =3D master
> > > +to =3D virtio-comment@lists.linux.dev
> >
> > From https://github.com/oasis-tcs/virtio-spec?tab=3Dreadme-ov-file:
> >
> >   When not to use the virtio-comment mailing list:
> >     questions and change proposals for Virtio drivers and devices
> >     implementing the specification. (please use the virtio-dev mailing
> >     list for this).
>
> That statement talks about the driver and device "implementing" the
> spec, not the spec itself, indeed there is another statement:
>
>   When to use the virtio-comment mailing list:
>      questions and change proposals for the Virtio specification,
>      including the specification of basic functionality, transports and
>      devices.
>
> So I guess this patch is right, since here we are talking about spec
> changes.
>
> BTW I'm honest, I'm always confused about virtio-comment and virtio-dev
> xD, so another "Thank you" to Matias for this patch!

I'm in that club too :D I had to fail once to get it right.

The problem with hardcoding the gitpublishto setting to the default
profile is that users need to be aware that if they need to send it to
virtio-dev, they need to manually remove virtio-comment and add
virtio-dev to the command line. I mean, the patch is good because in
most cases it will be the right mailing list to use. But perhaps it
would be nice to mention it in the README (at least, mention what is
the default), instead of relying on them going to .gitpublish file and
check?

>
> >
> > This also matches what I found in my .git/config where gitpublishto was
> > set to virtio-dev rather than virtio-comment.
>
> IIUC this is wrong, you should use virtio-comment for spec changes.
>
> Thanks,
> Stefano
>

