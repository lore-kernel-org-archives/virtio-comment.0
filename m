Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A361C78C6D
	for <virtio-comment@lists.linux.dev>; Tue, 29 Oct 2024 07:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730187153; cv=none; b=pIPOyYtmgwG6srGuOXvqmP0p8Jot0UrHZU/w1TcAiJzTiM4hzSDJycWzLMYC6snPdOikiI0ho2mDrTWH2xcHU7cgTvSVFzlDqGjRDsLIT751V6xIcekGZddFR6PIelIjZiwjeTczMMYdYKD09scIVBNlNG+PX4UQ+/IdeTJ5vVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730187153; c=relaxed/simple;
	bh=7Vw9FMmTgTUsM7s+5j3lHdqrMXu2irvsmGDJ+Az9uDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVTqGq+cU8MDeEEpnm8vwwOXzZsKo9z8mXg6lGT3R4Kmx5WSpvPeMvYZ9R8bFRRAdS/YxSLjhbkVcBX38mYsKpoJOlVizeYZIHwT7RX0xzyHFciNR6RFKQgdV05KG4creZRK75R+VvWr17mgRpVfRBlHQqx6w9ZGby37p/C6FJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KDdOgv6Q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KDdOgv6Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730187150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Vw9FMmTgTUsM7s+5j3lHdqrMXu2irvsmGDJ+Az9uDc=;
	b=KDdOgv6QzTLX3LdQvE365gS1hLtr6fskh16T33YC3izSTPChC0CgdGgpQ/xgVyUEiTKIcU
	dV+7Hh6+89NKkiwh5T2iPBw2u8/lk3sgajnKDwil6RpxrFZV+Q6RzQ48Na98qqGzKBenM2
	wqRtQc8B2Wp++6aGvxAAmrRgO26lkkk=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-XbgaFtH9Nea2oUGwsHVU-w-1; Tue, 29 Oct 2024 03:32:29 -0400
X-MC-Unique: XbgaFtH9Nea2oUGwsHVU-w-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-71e455defb9so6797646b3a.3
        for <virtio-comment@lists.linux.dev>; Tue, 29 Oct 2024 00:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730187147; x=1730791947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Vw9FMmTgTUsM7s+5j3lHdqrMXu2irvsmGDJ+Az9uDc=;
        b=nKEdagxhoGqddWlGojdbaSZE//YoVEiHV0Pq5TzMXAsNKIdPZdWuB6ojKTE4z/i/92
         4K/PP4kT86HXUKdNT252me42Qnsdo9ddSK8nnFxs4QziOMyyQiJcGRHVEvqR9kWJPOKM
         eIhTUt7H3TUt0Y17ZKoOcJSrCBEhfEj8dwwE5Q8OXZo4wGGqHtTk2RbrUA5IzWddXHa9
         3zY3ZUU+T7VjyB2tmLG8zE5lUEwOAilWk+HbIvLklcFHejiNSq6Qe4uwyw13mKO5vw69
         XSNmy/dZMu3bkH+ebCSPuAKkjl/1ZSyXMz2GofB81TYAc5SNFIUSKJHG5FHHpC/lLQD3
         +xZw==
X-Forwarded-Encrypted: i=1; AJvYcCXKBNz6XMK132ib33ZaVta3GuR7CbsP4cmGyDtVbCBoNLC7FCyB/CInmeRON+MTYbtAZdsGxg/WEmQulaZ6ow==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrH3CGFbEqRIVHVn96P0l0ViJ1nE7+Lgqn0Ar82b1QLwUCJvPY
	5pMbH1IOzi7qUP2JqpYtDc9RrMd2XOcf4UfrInwfq/JlauXbXzfD5v+QqaRD0w3oqactDPNByML
	N+Ivr2hRjqEwaws8ImdRkIMtJWV43hx/NN5RPSsCzAGRqkwa0U2xeQ4aJUGl8jduR6s78KdWeWT
	9A7N6jBo3TvKRy7Q+oC+YH57TT/2uv0cTs4fYFVmq54XYVOID79akD5mU=
X-Received: by 2002:a05:6a00:929d:b0:71e:4655:59ce with SMTP id d2e1a72fcca58-72062abacdcmr17328756b3a.0.1730187147424;
        Tue, 29 Oct 2024 00:32:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIjJVG732vvcH+CE2c+Atf0ELqUdnzcuQzUD7nHHlTN7Oa08VV3YYXF3ikJvxAqk+vM9FEr19CcQKL/nmtcA0=
X-Received: by 2002:a05:6a00:929d:b0:71e:4655:59ce with SMTP id
 d2e1a72fcca58-72062abacdcmr17328724b3a.0.1730187146891; Tue, 29 Oct 2024
 00:32:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1728029499.git.pabeni@redhat.com> <CACGkMEvrowr6CwF+=RiR+f3EagdKB=rzyCPCQcUdXee4a5MaZA@mail.gmail.com>
 <2b90c368-b514-4077-a6bf-43da075af4fc@redhat.com> <CACGkMEu5GWZrYVRN==F=vrRQQGnxj_WqX86YZ+diqC3s3m2m_A@mail.gmail.com>
 <10bc51b2-efbe-4f33-a1b3-827de4d0cd10@redhat.com> <CACGkMEuhJXMd0hGopyehESO1eNVRXVX+FaF7m8f6Y9yWCzoESA@mail.gmail.com>
 <44be2d9c-5624-4419-8e9c-e5302a5f6b2f@redhat.com> <CACGkMEsgJT1c93RZur20fUyjtxSX6dMPePEJvzbmNWpAHd92Mg@mail.gmail.com>
 <3e3d6984-65d3-46b0-aaa3-e6591123f95a@redhat.com> <CACGkMEsiRJ2zAcys0iFQkiL0h9MY-LOE4=LP7s4ksN=T+HY_Xw@mail.gmail.com>
 <7f40f3da-aa6e-437c-af73-97e44e1982d1@redhat.com> <CACGkMEu-83JEcs73R4Eym2tkcUT5Zsj7i2qOsB-9ivmLNf0b5g@mail.gmail.com>
 <5da197a8-a022-4c2d-a4ae-09e0948e620e@redhat.com> <CACGkMEu-AQea98e5xqj4Vfo4zog_nzeJQ_pLADAOY9ZogsS8AQ@mail.gmail.com>
 <a6ad7c40-d65d-4b95-a7ae-86d77eda4bdf@redhat.com> <CACGkMEs4xb=xEH2RwQYZFEP9WGdwT2jOSERmpzTto+PQuxgcwg@mail.gmail.com>
 <a036a534-722d-49cd-bdb2-cf60aadd249f@redhat.com> <CA+FuTSenzDeaWSorCEywzu84W62oykmyNWuKyFeiB-aeJMt6sA@mail.gmail.com>
In-Reply-To: <CA+FuTSenzDeaWSorCEywzu84W62oykmyNWuKyFeiB-aeJMt6sA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 29 Oct 2024 15:32:13 +0800
Message-ID: <CACGkMEu5i3SEF3ETbKkeWbz5apCvtso501+6ujFovM9_XK9B=Q@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Willem de Bruijn <willemb@google.com>
Cc: Paolo Abeni <pabeni@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 8:27=E2=80=AFPM Willem de Bruijn <willemb@google.co=
m> wrote:
>
> On Mon, Oct 28, 2024 at 8:08=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> w=
rote:
> >
> > On 10/28/24 04:27, Jason Wang wrote:
> > > As the topic becomes more complicated, I wonder if we can do somethin=
g
> > > easier, that is focusing on the one checksum offload first. And I
> > > would like to check the current Linux behaviour first for non-GSO UDP
> > > tunnel:
> > >
> > > 1) For TX, as you've mentioned, the csum_start/offset has already
> > > pointed to the inner header (but is this the innermost?)
> > > 2) For RX, what header would csum_start/offset points (considering we
> > > have nested tunnels)
> > >
> > > I'm asking to make sure our proposal doesn't conflict with the
> > > existing implementation.
> >
> > In Linux, csum_start/offset, both for rx and tx, points to the innermos=
t
> > _offloaded_ header.
> >
> > On RX, since GSO partial does not apply, such innermost offloaded heade=
r
> > correspond the outermost/only header (when no tunnels are configured) o=
r
> > the 2nd outermost, when tunnels are configured and GRO-ed.
> >
> > On TX, via GSO partial and local csum offload, the csum_start can, in
> > theory point to an header with an header with an arbitrary high level,
> > but currently no driver/tx path allow for GSO partial with more than 1
> > encapsulation level (may change in the future).
> >
> > The proposed specification change in v9 for NEED_CSUM matches the above=
.
> >
> > Since reaching an agreement WRT DATA_VALID handling looks problematic,
> > would you consider a virtual meeting to discuss the topic?
> >
> > Thanks,
> >
> > Paolo
> >
> > p.s. to be clear, with 'you' I include both Jason and Willem.
>
> Works for me.
>

Works for me.

> Might indeed be faster to get to a resolution than an email thread at
> this point.

Yes.

Thanks

>

