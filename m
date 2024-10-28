Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A3A1D934B
	for <virtio-comment@lists.linux.dev>; Mon, 28 Oct 2024 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730118452; cv=none; b=a5bwj7RctfLD2HXwC+U2diYXSoOpOypa5Uf92IxeeOuoq40VNTb2FVE4qJMYJGvaHqNSYqpaH10l+tVA7MiHBpigFTgZGqF1ryqoXyqX74bHk34Z5bBQfb7fklJwWIPj8i/YqSlwwM6uG7QR4mDJ2/l2jlfcIbIN+8+zMDTv4SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730118452; c=relaxed/simple;
	bh=ZX++JvRToFs/wQ1fOBqlffbSDD3KXUlHxAM+bRC6WzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oHYxl+wid3PACHlXN0B/9AEYytWF4GvwVJ3NpvyPKcnmtkp58Zkm3aZe5u7M79GfaoWK/5F3LqpzuR6YF4VId8Sm6Uil/TpSAJhwllwt+sIZawN3UnckhzFGq/Z+i0EpN1tgfdgIKWTXt2Ag8nWILwlPxIQZkm9CV3u1dR4RhM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kr8xKRB6; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kr8xKRB6"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e38ebcc0abso48111927b3.2
        for <virtio-comment@lists.linux.dev>; Mon, 28 Oct 2024 05:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730118449; x=1730723249; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZX++JvRToFs/wQ1fOBqlffbSDD3KXUlHxAM+bRC6WzQ=;
        b=kr8xKRB62/reD/13JfAkpHS9uM7svutqqH4T8GVSlf5CuKQbaJzzmCglv//OPQtxeq
         Vp8Gh8or4G1j+3O9pJZlUsZAlkTBVxVKuuNZCg8IdgpVJLEdcPUfW8CEjdypvtPCPjQV
         IybNlO5xZgZEoUqw4q5JHbCzr8az2Ry12bInQBgl6XGQhETjkr1vt23NA1xZeVEUlVOM
         zYKkXcNDBGToZOMIwr+UmRY670y3Ia/D2AkYUcX1ARqpS8ggILz5jSikYlOfwA6ZDrIM
         tAuaMDB4163GL6DGElrw1a83/cV8E1YxbFnD1+eboWBQL+1PH+E6xRRnhgR5dOELrDex
         ynzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730118449; x=1730723249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZX++JvRToFs/wQ1fOBqlffbSDD3KXUlHxAM+bRC6WzQ=;
        b=EXRWuKWAiVDxzv4Kth0XJhhMnF8zLrROGClJTAc7WCWKAy4SCBMQmWkJn8C3m35or4
         QEAGf9R+eTQDz4s+ddgqS0i8t3YktS4Ub1pZbbo6QY/vA9vWVYFZWPlqDAstq97RRTWI
         eB7dbzFnXvdL/s5SLdeKHYz8arnXpjToEyxYki4pxx+EbK8NzAz9uApcE5iMhJVc3kE2
         DGXXpfvp+TKJAmnJTuBQnOFlU+jtdRJfe4cXxy/Seb5DnCrsc/HqcwTR/Y2aQ5CUks8J
         fL5eG00QqYSFAmvKqr/+eodkgPa/SbqcsM+WuncKa4lZkFG2jEhS6gRuvftbgSfEBvoi
         h4gA==
X-Forwarded-Encrypted: i=1; AJvYcCXf81PtzjhT+6vGjNgjnImfTyxeMNleFkJAEI/kPPRZsuEUSSm10EMFmu4RQSapEqL1WwUz+yxfOvcAh2GIVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YznFKTaN72GQROas4OIQt8DgEEdTu5FukXSivcO/6Na02+IYLZa
	UUcc65zT+rn05dQR/zUx0Md6QqkiZp9AD3+2I4sy0MaqsEJU/YeO7HOlwT6724zwSypNiWFwV3D
	s69p62iCFOFhnzJukTmxH+PZv4OenoMnzi2nK
X-Google-Smtp-Source: AGHT+IGmZhthKX3HnGrUGu871XsgwjtCBU88fwcpKf6ORlcyBbMHhkpU2grw9qeUThl1QCG+3T+H7lDz/T8PblgZnYw=
X-Received: by 2002:a05:690c:660a:b0:6e5:e6e8:d535 with SMTP id
 00721157ae682-6e9d88d03bdmr58852707b3.3.1730118449023; Mon, 28 Oct 2024
 05:27:29 -0700 (PDT)
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
 <a036a534-722d-49cd-bdb2-cf60aadd249f@redhat.com>
In-Reply-To: <a036a534-722d-49cd-bdb2-cf60aadd249f@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Mon, 28 Oct 2024 08:26:49 -0400
Message-ID: <CA+FuTSenzDeaWSorCEywzu84W62oykmyNWuKyFeiB-aeJMt6sA@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, kshankar@marvell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 8:08=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 10/28/24 04:27, Jason Wang wrote:
> > As the topic becomes more complicated, I wonder if we can do something
> > easier, that is focusing on the one checksum offload first. And I
> > would like to check the current Linux behaviour first for non-GSO UDP
> > tunnel:
> >
> > 1) For TX, as you've mentioned, the csum_start/offset has already
> > pointed to the inner header (but is this the innermost?)
> > 2) For RX, what header would csum_start/offset points (considering we
> > have nested tunnels)
> >
> > I'm asking to make sure our proposal doesn't conflict with the
> > existing implementation.
>
> In Linux, csum_start/offset, both for rx and tx, points to the innermost
> _offloaded_ header.
>
> On RX, since GSO partial does not apply, such innermost offloaded header
> correspond the outermost/only header (when no tunnels are configured) or
> the 2nd outermost, when tunnels are configured and GRO-ed.
>
> On TX, via GSO partial and local csum offload, the csum_start can, in
> theory point to an header with an header with an arbitrary high level,
> but currently no driver/tx path allow for GSO partial with more than 1
> encapsulation level (may change in the future).
>
> The proposed specification change in v9 for NEED_CSUM matches the above.
>
> Since reaching an agreement WRT DATA_VALID handling looks problematic,
> would you consider a virtual meeting to discuss the topic?
>
> Thanks,
>
> Paolo
>
> p.s. to be clear, with 'you' I include both Jason and Willem.

Works for me.

Might indeed be faster to get to a resolution than an email thread at
this point.
