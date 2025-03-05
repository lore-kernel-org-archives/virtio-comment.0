Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13591DE89E
	for <virtio-comment@lists.linux.dev>; Wed,  5 Mar 2025 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741162888; cv=none; b=gwNNdguGe3so0dHVaF1X0xqevnkEv39O1AQ5W5C2OgKrivVEnFEOd9zqF8PujAAD04aFj2YzUaD04oeD6YyNxv/ocsnjbPTiXRKd6/y9/P9CsfmImGnOYkETK9aUwE3gY8lGLFul9CJUOS8Vbl9EzwnHwx8bP/DUVuJZoeK4HEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741162888; c=relaxed/simple;
	bh=Z1NrqJoYVn9rtv7xy56TbMMaXbCEJUxqXaFlj5E+qHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qD0RrKxq/MkkEwHCJ2+GidRK1+O6L6qumfVuFOqNLygglhU+z5ExGP3kmGA+EacNbqfWm3eHtgD6JwzvxclRlQ50SQQTUMJxJpo/2iykidZWy1YTDRxkyl5YjU9BXRFQc0WUo3X19D2iNBZVS4kzblPyzRlIkTDVvgqhZ8STiL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NzHlL+4r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NzHlL+4r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741162885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UhU8UR8sFSbKpZlHv0EzMthsIydBOyLlLqtePgDfVL0=;
	b=NzHlL+4rXr8XoU8UoJr8qihMW2pm9NWBpe8Cl1rIbKMoZMnZk3G0IZZ11ljoFBRv53R1KX
	PF9QhS1vN8SF5uFvPctOhxzVpSLP5V603XIcqlooRD/NQNYdrlgMqm3AqJ+tsqpLll9c+x
	I5+dLXuyj4Asllh7izHAq2+OAP5Dr60=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-DTmwvRkMML2bWRhdgxK5oA-1; Wed, 05 Mar 2025 03:21:24 -0500
X-MC-Unique: DTmwvRkMML2bWRhdgxK5oA-1
X-Mimecast-MFC-AGG-ID: DTmwvRkMML2bWRhdgxK5oA_1741162883
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-6f2b386136aso104819247b3.1
        for <virtio-comment@lists.linux.dev>; Wed, 05 Mar 2025 00:21:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741162883; x=1741767683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhU8UR8sFSbKpZlHv0EzMthsIydBOyLlLqtePgDfVL0=;
        b=Z6cbhZuCi+Fyednuu5GNd0BB61tB48/udfhkUeNQgwt8mVIwQjqtxV8n4b9NycZLyN
         T3aW0gfyvUZPS/U+d7nKLdKRWdPJKFDphT4l7niGK+rYsWX642EjAjpdneDAUgXeVAip
         5syIFlOFy+i3zaDHMn+Tac2dJP5AgeNiH/Bg4pfDUCb6zkbHYxWwjy/vUcRZWtxMBuV5
         g7PlReW0AoKmEnbrvtgwyg74wdbYpVsb8HsTpeXl6hY6LTjX7yKYt9CBfceU8l6+g93P
         tlXlAvWN1hQPoyPkojMrqUwSm46n5XkjoD89V5CqaOQUnrT9Ln/fiZFOV7G2kCFnUiRW
         QWug==
X-Forwarded-Encrypted: i=1; AJvYcCVKxjlvwHBtuoudWnT7c6BFxXkfZ6a5FYGs0feCoaCMDdrUX/YGW6pyPc8I5q3c18f6B+GddhX2/eTBR/mDMw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn41TrCx5dXzc2fnqBdwgmifhWIK62QwhMqLdjBT/uPEEdySDB
	rmNpCW+8q+2QaoOsYptXjc8KpAjkxlLuK4APs5kXZPOuVDxZK9wC1gSw8v6D/F6h5Ud7U1ToaXn
	n9A75wGU066v14s7ndotr7OmBn9lMG+KN9+h6zrO+zaVHVBiFyuCunknsel2KqcUpLISppBpL2O
	1MQEK+8S5fEtUIzu+Hr+pY5fsXSjwlfrK0mItjR2I=
X-Gm-Gg: ASbGncvPpPJZd2mf2erteIAjpy0fMTzz5efx0luPsekXAtsd5m7m0NgUWl2Gfhd0Tm5
	dKr72ZhTMZH7rvVgJuwiRcc3/unOFlH9qx0neArDM9BBqLM5BmMgzqUN4lvhOYGiozkouESs=
X-Received: by 2002:a05:6902:240f:b0:e5e:14d4:e630 with SMTP id 3f1490d57ef6-e611e329c38mr2761005276.39.1741162883469;
        Wed, 05 Mar 2025 00:21:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHi7xZB7A8j3JEcNbx5+Xr0n7Ps0sHjiJBY8wtKMGnKU9Vsrfk5FBeqdQliC6grFxbIZkeKS8XHQ0RydfEczUM=
X-Received: by 2002:a05:6902:240f:b0:e5e:14d4:e630 with SMTP id
 3f1490d57ef6-e611e329c38mr2760977276.39.1741162883106; Wed, 05 Mar 2025
 00:21:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250304161113.1445602-1-mvaralar@redhat.com> <CADSE00JHFcsg2vHVOymDd9pawbGWPiBOpZ1guRivAOOOK33xKQ@mail.gmail.com>
In-Reply-To: <CADSE00JHFcsg2vHVOymDd9pawbGWPiBOpZ1guRivAOOOK33xKQ@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 5 Mar 2025 09:21:11 +0100
X-Gm-Features: AQ5f1Jp0O7McU111cY1VQVqxMJ6JVoWd3YeLyyg3VTkGoQZBZn5nDdP03u1PKaY
Message-ID: <CAGxU2F6+5MHvEyLbOFnQNf9jY=LNq7krhQD+TjJDPj8raZd+Mw@mail.gmail.com>
Subject: Re: [PATCH] git-publish: add profile
To: Albert Esteve <aesteve@redhat.com>
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>, virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: neZ6TOpswwKZh4fbiMSRQgc315xyJAiKJOlZkBGKj8s_1741162883
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Mar 2025 at 09:12, Albert Esteve <aesteve@redhat.com> wrote:
>
> On Tue, Mar 4, 2025 at 7:47=E2=80=AFPM Matias Ezequiel Vara Larsen
> <mvaralar@redhat.com> wrote:
> >
> > Add git-publish profile and document how to use it.
> >
> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > ---
> >  .gitpublish | 3 +++
> >  README.md   | 9 +++++++++
> >  2 files changed, 12 insertions(+)
> >  create mode 100644 .gitpublish
> >
> > diff --git a/.gitpublish b/.gitpublish
> > new file mode 100644
> > index 0000000..d412896
> > --- /dev/null
> > +++ b/.gitpublish
> > @@ -0,0 +1,3 @@
> > +[gitpublishprofile "default"]
> > +base =3D master
> > +to =3D virtio-comment@lists.linux.dev
> > diff --git a/README.md b/README.md
> > index c06caf6..39f22d4 100644
> > --- a/README.md
> > +++ b/README.md
> > @@ -110,6 +110,15 @@ git format-patch -o proposal1/ HEAD~1..<br>
> >  git send-email --to=3Dvirtio-comment@lists.linux.dev proposal1/0001-*
> >  </code>
> >
> > +<dl>Optionally, you can use git-publisher to submit a patch. The proce=
dure is the following:
>

I would mention that the project already has a git-publish profile, so
the "To:" address is automatically handled by it.

> s/git-publisher/git-publish/ ?
>
> Maybe even worth adding a link to the project repository?
> ```
> \href{https://github.com/stefanha/git-publish}{git-publish}
> ```

+1

> Especially since you need to install and set up the tool beforehand,
> so it is nice to have the link pointing to the project documentation.
>
> > +<code>
> > +git checkout master -b my-feature<br>
> > +# work on new commits, add your 'Signed-off-by' lines to each<br>
> > +git publish<br>
>
> The first run (unless you pre-configure your profile in the project
> git config) needs to specify the recipient (with --to) and and cc's.
> I'd add at least the `--to` to the example.

IIUC the goal of this patch is also to add a profile (.gitpublish) in
the project exactly to avoid that.

Thanks,
Stefano

>
> > +... more work, rebase on master, ...<br>
> > +git publish # will send a v2<br>
> > +</code>
> > +</dl>
> >  <dl>
> >  <dt>When to use the virtio-comment mailing list:</dt>
> >  <dd>
> > --
> > 2.42.0
> >
> >
>
>

