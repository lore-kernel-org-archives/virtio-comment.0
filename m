Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A3F31A89
	for <virtio-comment@lists.linux.dev>; Thu,  6 Mar 2025 16:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741277619; cv=none; b=WBqa6tEEiE219IkAOYrWSTOIezN/G2Pvlp9T4NFZleV68tpIvsBEz/jKVmrxGR+gMRgG5fPlQ5QstgM6wJGX1z2wbFqqJBvi6Z3wkxwC8dZsTRcatwxybzjP6mi45Xw1T9t/gzaxc8KKUAMB+ftsXTnqUiwxFzkln/8TuGB2iv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741277619; c=relaxed/simple;
	bh=db4AbDhBZCg36qmeucK9xwZm8ayjHyKArVxtxgfu0uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mWfsIUlYiguKhSpqoOwI7d5ZO8yWBh5XOG/mVnUOk+W+qVz/LoXLushGnaMYAtbcOO07f23/P3MbXiHPqmJfsDAPzRyN9De7P81MP6CstyqTibZ6rt6eRfm9mtvv+aF98OlLlNRv7zgnWnsKLspSdro++v7d0Ew97tjRcM67Gy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QjeOw8UT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QjeOw8UT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741277616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ks8NEVLkZWUXEQmyp87ux61/+uUw8fJR85Mc2rR/83A=;
	b=QjeOw8UTH5Jsu06l8GkW9Uny9qIS1v+vzk0rJLvBAl8BzFrIE3mg7EWxbbb8sVyX96GiDJ
	O+EH4FuURz4oKFvVib0SzvykYgHBNB4fvr5kqjL+k38cYuJclPz9k2yo4+zdKMBlZuxoHd
	TLcL+lIauuxuU/5SUjCFCXGOeRKdr1s=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-Ff11zw9qPXKjYr4tJUtL3w-1; Thu, 06 Mar 2025 11:13:33 -0500
X-MC-Unique: Ff11zw9qPXKjYr4tJUtL3w-1
X-Mimecast-MFC-AGG-ID: Ff11zw9qPXKjYr4tJUtL3w_1741277613
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fecd603bb8so1656655a91.3
        for <virtio-comment@lists.linux.dev>; Thu, 06 Mar 2025 08:13:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741277613; x=1741882413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ks8NEVLkZWUXEQmyp87ux61/+uUw8fJR85Mc2rR/83A=;
        b=BcRbCvv4V1GiG59215XrSn0JpHfNIjuXG86JPjoH53yNSNuaaE/Jvol6npC9e3X+Mv
         kt0yt3B1gF4xyUe7BkyKR5aDW0aBnHdZ5cTn8uHgugpK5LgiTpYcFCclaeyGZY466BUc
         QLnLGhaAmR2FIMWYLtRAnIa4f4MhW/5PWfj0YT2DuKqSzvZ+ktKRlYF1jpF43EtGkFKd
         Vu6OTSRZsj4Lqrjp+v1p7glliJ+NFFK59sgIWid0KguH9oboGxnEG/WbWo1M0BskxGr/
         lDss7LgECYZrF3Az+Rh7jE/Wiiynioj3szE80XjKFPOoHBOYXNml0PNVxyKBXoHhvuS8
         T2yg==
X-Forwarded-Encrypted: i=1; AJvYcCXgrhb0o1bcll1NITYdvJo3EfLnv0sS0mtJXz3R0EaquztYKggjypplx2Sawll1oMi6bZsYyh1SlGw71KJZuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyP3ntxlCoXdXXCNIbNykJwwiUBxADCfMquC+TfJXA0QQcN3ZoS
	l7QBR6knghPgS/lAZIzDeJKqmLr7bg54/PuWO7/UoZqMH/SiF7TTWT0gvehq6eU8sV3lZgAGxsO
	fJQQaAwZ12VwdKX+IIuyBo2iX3IudhVWTdflclCJ9pkL1Xh1Vlm8DpfIoW2z6vrF1yciYgJA7iX
	SqxQ9flDOZxRX0n5m37HZXOpyZPLbvHJMtBwvHWzk=
X-Gm-Gg: ASbGncsf51gU0EV9Rzk9Q4KOt/XArOSh5o/nhasyCYY5UTqn6SWigpeRn5QkvdD9mJ7
	qTSqr8E5FS6hCFQ3kbLY/AVvk7ipmCHKLXrf0UWZOlQntk9XNn4G14AYnOEV7Bri0D4B5xA+es8
	A=
X-Received: by 2002:a17:90a:d64e:b0:2ee:8e75:4aeb with SMTP id 98e67ed59e1d1-2ff497534c7mr14400030a91.17.1741277612778;
        Thu, 06 Mar 2025 08:13:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPN/BgkF+SAbUHWxSToSfdKBT6VgEnjZKJS60qST3rjF1IcvleRdWGOb8Q2u5Ys2jnb/HRAjIXHnGj0UKRW3Q=
X-Received: by 2002:a17:90a:d64e:b0:2ee:8e75:4aeb with SMTP id
 98e67ed59e1d1-2ff497534c7mr14399979a91.17.1741277612353; Thu, 06 Mar 2025
 08:13:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250305164546.1484029-1-mvaralar@redhat.com> <20250306052231.GE303194@fedora>
 <CAGxU2F6DBhLhEGmABm6RrR=mXh9iwScWoqWeV0BxejH97Yik1w@mail.gmail.com>
 <CADSE00J+NDzOLx6yYsM1BcfCpwDa=BL22sYLG9A-RFww_aNEMw@mail.gmail.com> <CAGxU2F7SzkDsouz06p3hRmLBq6XA658moLS0mfbAwQq6Ei6_Nw@mail.gmail.com>
In-Reply-To: <CAGxU2F7SzkDsouz06p3hRmLBq6XA658moLS0mfbAwQq6Ei6_Nw@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 6 Mar 2025 17:13:20 +0100
X-Gm-Features: AQ5f1Jq4OMqG_x9lHC6YKVF9r6kGzdeES8hdllNr_ojFxSsPJYJNwoFAFhHm3PE
Message-ID: <CADSE00JWMNa5ruFn8Q99P_nvZ9pMCwTeCWPRXScYnqHPATKNNw@mail.gmail.com>
Subject: Re: [PATCH v3] git-publish: add profile
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Matias Ezequiel Vara Larsen <mvaralar@redhat.com>, 
	virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Za1d3nBVP4FoJxDXEsMRGt5aDRS6-0m5LJN9HF5JfYQ_1741277613
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 11:51=E2=80=AFAM Stefano Garzarella <sgarzare@redhat=
.com> wrote:
>
> On Thu, 6 Mar 2025 at 11:44, Albert Esteve <aesteve@redhat.com> wrote:
> >
> > On Thu, Mar 6, 2025 at 10:58=E2=80=AFAM Stefano Garzarella <sgarzare@re=
dhat.com> wrote:
> > >
> > > On Thu, 6 Mar 2025 at 06:24, Stefan Hajnoczi <stefanha@redhat.com> wr=
ote:
> > > >
> > > > On Wed, Mar 05, 2025 at 05:45:46PM +0100, Matias Ezequiel Vara Lars=
en wrote:
> > > > > Add git-publish profile and document how to use it.
> > > > >
> > > > > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > > > ---
> > > > > v2 -> v3:
> > > > >    * remove uppercase and the line split and use italic
> > > > > v1 -> v2:
> > > > >    * add link to git-publish
> > > > >    * document that the project contains a profile already
> > > > > ---
> > > > >  .gitpublish |  3 +++
> > > > >  README.md   | 15 +++++++++++++++
> > > > >  2 files changed, 18 insertions(+)
> > > > >  create mode 100644 .gitpublish
> > > > >
> > > > > diff --git a/.gitpublish b/.gitpublish
> > > > > new file mode 100644
> > > > > index 0000000..d412896
> > > > > --- /dev/null
> > > > > +++ b/.gitpublish
> > > > > @@ -0,0 +1,3 @@
> > > > > +[gitpublishprofile "default"]
> > > >
> > > > Great, this will make it easier to send spec changes!
> > > >
> > > > > +base =3D master
> > > > > +to =3D virtio-comment@lists.linux.dev
> > > >
> > > > From https://github.com/oasis-tcs/virtio-spec?tab=3Dreadme-ov-file:
> > > >
> > > >   When not to use the virtio-comment mailing list:
> > > >     questions and change proposals for Virtio drivers and devices
> > > >     implementing the specification. (please use the virtio-dev mail=
ing
> > > >     list for this).
> > >
> > > That statement talks about the driver and device "implementing" the
> > > spec, not the spec itself, indeed there is another statement:
> > >
> > >   When to use the virtio-comment mailing list:
> > >      questions and change proposals for the Virtio specification,
> > >      including the specification of basic functionality, transports a=
nd
> > >      devices.
> > >
> > > So I guess this patch is right, since here we are talking about spec
> > > changes.
> > >
> > > BTW I'm honest, I'm always confused about virtio-comment and virtio-d=
ev
> > > xD, so another "Thank you" to Matias for this patch!
> >
> > I'm in that club too :D I had to fail once to get it right.
>
> :D
>
> >
> > The problem with hardcoding the gitpublishto setting to the default
> > profile is that users need to be aware that if they need to send it to
> > virtio-dev, they need to manually remove virtio-comment and add
> > virtio-dev to the command line. I mean, the patch is good because in
> > most cases it will be the right mailing list to use. But perhaps it
> > would be nice to mention it in the README (at least, mention what is
> > the default), instead of relying on them going to .gitpublish file and
> > check?
>
> I see, but do we really have a case where changes to the spec need to
> be sent to virtio-dev?

Judging by the README I'd say probably not? But looking at the
messages in the list, I found one example of a spec change in
virtio-dev [1]. Although that is not a good reason per se, as it may
just be using the wrong list.

[1] https://lore.kernel.org/virtio-dev/20241107105103.19152-1-mgurtovoy@nvi=
dia.com/T/#u

>
> If not, I'd avoid to mention to increase confusion.

Yeah, let's do that then.

> If yes, maybe we can add another profile section in the .gitpublish
> file, with a different "To:", and mention in the readme, but I'm not
> sure if we want people sending changes of this repo to virtio-dev.
>
> Thanks,
> Stefano
>

