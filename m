Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF27B53BE
	for <virtio-comment@lists.linux.dev>; Thu,  6 Mar 2025 10:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741258308; cv=none; b=r1FsVLkp6hFNRbwpK75hMsTNDvwKc6bLwdrWWjCkwyQluBjKMlrYS/+O/K+q9evvbTfaXFnjFLB5uZ3zm+D4jcigH68xlS6310DOLfy/MUNXcrncqRMyqMVp3g0p4lVJz2Is3JlzSHVDiQsipLqMzclEdhW9TsaIWV5JJ1uSA/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741258308; c=relaxed/simple;
	bh=dkLgY7Epi1E4drL8GI+8MNYl0t+e8la9otPWzBu1Hu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAla8LQD/1KemijXx+X+uZ6U0jfJ+Q44dtSzlIE/+lVvzqubmSZSXo+gbmwcAcTUIAPeLG34rMUF5IP01ahSZGhdXDEE6tR6SQ1RLf+oLcxC42FFxV2rjTKJPpiQ3IDLy9V3Arz5LZqJqiutZlWOKvWwXmJ+YNQaX3nJiOD2c7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rc4++scJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rc4++scJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741258306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NgAPptrvEzXIOc9IYRu6ExqFuUhmLj1G/nMiASDoO/A=;
	b=Rc4++scJjA9gLqvzQGLlxdqfXM6PTZeNlrbfRpJ/rj08ykXhsbs1MiwISwAyhPbUuH0LxS
	f9kDPY/TlLnha1FQThJUt2RPA1i/GzgBGTa3Mqjgv/h+duoLGfFn0e96f7IJEFPN/2vUqG
	qsc4OSxqQjc3jCeydkDJyLtQIPnFd7c=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-KazoI1qgPW6oaqpj_D6CSA-1; Thu, 06 Mar 2025 05:51:40 -0500
X-MC-Unique: KazoI1qgPW6oaqpj_D6CSA-1
X-Mimecast-MFC-AGG-ID: KazoI1qgPW6oaqpj_D6CSA_1741258299
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-6fd43b37dc3so7176077b3.3
        for <virtio-comment@lists.linux.dev>; Thu, 06 Mar 2025 02:51:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258299; x=1741863099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgAPptrvEzXIOc9IYRu6ExqFuUhmLj1G/nMiASDoO/A=;
        b=chOG5Jg6DHBrTpxi/VWV0QXftnJ0/BuEFmdWm0TkYjji6XQgcg603Kcf1IsrRViXQ3
         OV4vY6XpQxLMQB0e521weH401RfdPW82Fr5YxhTDNs9vitYIUf4ka+Hs0kTRIUhpDbII
         6z32yDQM+aoS7MYRY151eeefJejqMgtSaR8EbtSPZfA7/pEzNPUVWsiMVElGVbN+CjRy
         b/aUrD6t7ONWGX92Wv5OUVtC8r2pMRmpQHyyyZCGmBh0JmyTYzkkI4pwPvosBK3fydl5
         41Xg2jITDMbehNlbr2nN0MBPlStTpkVjjD0Q8mQzTHgSdxoubfo5z7QYspwPUiW1xgVg
         E5bg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ4IvIAGtK/5p3DSDDVr8dgVavHzetHW+pLS6miXG3+EJcSHIjujnJpYkO0MUDZGDjF1oDcqBDraubJLLHTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3CSZdQUg/TfIESgSMi9/R90Bw7oTZVkx9IqSswcPLXt3vRIqW
	JBLw0wJPDdoCCsX4U1ckD2jCufUJDPRkSgFVs6qfzPqpRK9QyyNBl/zz9qaaD6kqP8CRQZMA5I5
	ZvqunpiEzpOCxoZaFxmDg4MTAvDE25Q4jww8bBDxnDUBrUNw56lj0IvHop+8KsFa6sSa0AFP3IV
	eu/bIkgr+8Rjwyl4dbmwuDaX6R+SDIJOMYmZum5Vo=
X-Gm-Gg: ASbGncvhZMfgvdrdGZOs1wDsGvvoHiLySRuZLEcat6Z+lowpEVGTMCd/A90j7mRBmTP
	GJIbaPE3VdhCDmqUwHtL95YJQKkHFk5NSyp6Frs4mH2B2hevIs5Icl6DiG4L3pm0P6G5Xz/M=
X-Received: by 2002:a05:690c:6210:b0:6fd:3cbe:753c with SMTP id 00721157ae682-6fda30701b9mr85134757b3.36.1741258299484;
        Thu, 06 Mar 2025 02:51:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6syNSLzotWdqHOECWQ0gdiYRJXZt930sk4sCqGKzlj8pTVoBOCDT1gO6edgp261WCxkrMVgUSEvfcCwRMLfA=
X-Received: by 2002:a05:690c:6210:b0:6fd:3cbe:753c with SMTP id
 00721157ae682-6fda30701b9mr85134677b3.36.1741258299073; Thu, 06 Mar 2025
 02:51:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250305164546.1484029-1-mvaralar@redhat.com> <20250306052231.GE303194@fedora>
 <CAGxU2F6DBhLhEGmABm6RrR=mXh9iwScWoqWeV0BxejH97Yik1w@mail.gmail.com> <CADSE00J+NDzOLx6yYsM1BcfCpwDa=BL22sYLG9A-RFww_aNEMw@mail.gmail.com>
In-Reply-To: <CADSE00J+NDzOLx6yYsM1BcfCpwDa=BL22sYLG9A-RFww_aNEMw@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 6 Mar 2025 11:51:27 +0100
X-Gm-Features: AQ5f1JpzkkoxTsWZJmr4CCi-hH7U0OH_jdw__sTwVw6dVZqRhKjS3F4v8YmPkVA
Message-ID: <CAGxU2F7SzkDsouz06p3hRmLBq6XA658moLS0mfbAwQq6Ei6_Nw@mail.gmail.com>
Subject: Re: [PATCH v3] git-publish: add profile
To: Albert Esteve <aesteve@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Matias Ezequiel Vara Larsen <mvaralar@redhat.com>, 
	virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a51IVwcKk8FwfNs5XKtcAL9CSVsKGgkZufjGL09HugI_1741258299
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Mar 2025 at 11:44, Albert Esteve <aesteve@redhat.com> wrote:
>
> On Thu, Mar 6, 2025 at 10:58=E2=80=AFAM Stefano Garzarella <sgarzare@redh=
at.com> wrote:
> >
> > On Thu, 6 Mar 2025 at 06:24, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> > >
> > > On Wed, Mar 05, 2025 at 05:45:46PM +0100, Matias Ezequiel Vara Larsen=
 wrote:
> > > > Add git-publish profile and document how to use it.
> > > >
> > > > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > > ---
> > > > v2 -> v3:
> > > >    * remove uppercase and the line split and use italic
> > > > v1 -> v2:
> > > >    * add link to git-publish
> > > >    * document that the project contains a profile already
> > > > ---
> > > >  .gitpublish |  3 +++
> > > >  README.md   | 15 +++++++++++++++
> > > >  2 files changed, 18 insertions(+)
> > > >  create mode 100644 .gitpublish
> > > >
> > > > diff --git a/.gitpublish b/.gitpublish
> > > > new file mode 100644
> > > > index 0000000..d412896
> > > > --- /dev/null
> > > > +++ b/.gitpublish
> > > > @@ -0,0 +1,3 @@
> > > > +[gitpublishprofile "default"]
> > >
> > > Great, this will make it easier to send spec changes!
> > >
> > > > +base =3D master
> > > > +to =3D virtio-comment@lists.linux.dev
> > >
> > > From https://github.com/oasis-tcs/virtio-spec?tab=3Dreadme-ov-file:
> > >
> > >   When not to use the virtio-comment mailing list:
> > >     questions and change proposals for Virtio drivers and devices
> > >     implementing the specification. (please use the virtio-dev mailin=
g
> > >     list for this).
> >
> > That statement talks about the driver and device "implementing" the
> > spec, not the spec itself, indeed there is another statement:
> >
> >   When to use the virtio-comment mailing list:
> >      questions and change proposals for the Virtio specification,
> >      including the specification of basic functionality, transports and
> >      devices.
> >
> > So I guess this patch is right, since here we are talking about spec
> > changes.
> >
> > BTW I'm honest, I'm always confused about virtio-comment and virtio-dev
> > xD, so another "Thank you" to Matias for this patch!
>
> I'm in that club too :D I had to fail once to get it right.

:D

>
> The problem with hardcoding the gitpublishto setting to the default
> profile is that users need to be aware that if they need to send it to
> virtio-dev, they need to manually remove virtio-comment and add
> virtio-dev to the command line. I mean, the patch is good because in
> most cases it will be the right mailing list to use. But perhaps it
> would be nice to mention it in the README (at least, mention what is
> the default), instead of relying on them going to .gitpublish file and
> check?

I see, but do we really have a case where changes to the spec need to
be sent to virtio-dev?

If not, I'd avoid to mention to increase confusion.
If yes, maybe we can add another profile section in the .gitpublish
file, with a different "To:", and mention in the readme, but I'm not
sure if we want people sending changes of this repo to virtio-dev.

Thanks,
Stefano

