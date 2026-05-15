Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597E5439005
	for <virtio-comment@lists.linux.dev>; Fri, 15 May 2026 09:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837025; cv=none; b=EreFIRxWa2Hcw74u+k5oV2Ec+blgtcoJS0N/sPTvEOM+Dre7LNue8JEO3N3k6B29Ee7UjFV/V+91qamwxST6OzUV/GL9pdDBA5aZFB/AXra4UIooqhyZE4fmaQbsYMJKp9lAgvzRO/3DWfoLK0sZ4vQEIQuCObEGfVol+e0GeMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837025; c=relaxed/simple;
	bh=9tdR6q6FM3eDDRUURMR4HHTQGcArUrco8kdE94aPp5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=dOlpxNPMnYN0+flW0y7xOI9JdYo3JvEsxZr27y0GnEE9R2Zyxp8wXWdeEymQy94E07TfdkJfIpNH3eH5en9sOn1Ef5TVMrkFKTGPiK+JcgY5xmdDUr7M0Nn5DE0Ny+KH+H+UDRzSsDjbs7QDo19F2rhrNmkyXaP8Mjzx9VYbVpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NfIfcvlf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NfIfcvlf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778837023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nudVa7JwRn66yNBpf6lypmN1agdVF6S45Xmi60++crA=;
	b=NfIfcvlfWDc+mDEsrUTdyGFJ227jZ124S8H7kPpK3bsBjiRUofzVx3R57JVSFHceMzTKdl
	kI/4wurCDECipJmJ9hsBM52szvbcEjDMKPHj8/1Ma6hph1HGD1ynNusSThoXR/uhZkjzWr
	+Iz4WdYEqWHtpmZX7MN4fx0HV+Sj8Ms=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-MXmb8NS9PgiU2eTPEmd5Yw-1; Fri, 15 May 2026 05:23:41 -0400
X-MC-Unique: MXmb8NS9PgiU2eTPEmd5Yw-1
X-Mimecast-MFC-AGG-ID: MXmb8NS9PgiU2eTPEmd5Yw_1778837021
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48fed2519daso2331955e9.0
        for <virtio-comment@lists.linux.dev>; Fri, 15 May 2026 02:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837020; x=1779441820;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nudVa7JwRn66yNBpf6lypmN1agdVF6S45Xmi60++crA=;
        b=q6I2nwnF7ZDvnRgiogf4I0v8qWdG04e9qy3D3gP9TPUnR36QwLpq1b1E4mMKs6uxbE
         npW/oWVNwvFuxSChxx+0kujVer+6arDW5CG4d8TYdB7Bdg9WFrzVMDrPs9PMsR6iMjkg
         miP5iptzO4BExpDSuBWW/2cY83G9jyblc92lQSgMb4gduEp4ddKaF+z0U9Z+UnOgXjMz
         Nk3/y1jdZAPlw2fsUfcoGdpSASnGc47eOlOrM0fFVARWHbWybYu6nZQqbjpc60LLH8re
         3LpBL4GQm7VKhmuO3kHFq3X7fyAof2xLzal8IUdlg7i7wpydsx/mOttZ9Txk8dF4txSh
         M0cA==
X-Gm-Message-State: AOJu0YxaQ0W6/t5pnY2/3q460sBPclfgnT3jzOTIVvScp2+hpNTpmUsm
	e3fpbicY7EAzuuMgMsYaTNX+ZJsVgpxr9RzFhpK4rxS/4PqHuc9C55iHBA/x731sOUKG/dxXtfB
	teyjO6HEEy7mKa2EU0l8GiJzMn37ryCkm1ir5me1Rziw/aQkuMhn+spu6PSoFG+9JCy6O
X-Gm-Gg: Acq92OG4cVJcWQE89GvWzHFEO0MK3zcJ35P0RNaLMk7nFeAoEcxjvFM7eAdlsEdW/m5
	NVjC2yGLWYJPyfiSnl4T7oEGB3lncdGuHMbJI+14Skxo2V6lDd3pLTKf26cessQmC9ojI/bbHU2
	lwtWZkNu2kqcGs3a685CaXRE6RerH3nl2oaoUhWjniY2t7ifnTxjlv1kwsLavgxvJHGg00v2CDw
	DwXfYvjlincPg7+h00f1aVHxbO/GrglO5b529JNTQMUL7VCgKkGvGi8AuT+/rT9eLtiReiFdNqm
	Ji87lateA98itOGliZywZAbAWW9h5QzbeK98RZRQC7RjtXxy9CUV2jYqpICGfn3NLMqdBLSvMBq
	k0xwe/ZfLok8z8tXLVuXhptKUHt88TDtNJO6yY9nISkJsueeM2wU=
X-Received: by 2002:a05:600c:848c:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-48fe60e51c6mr37122345e9.7.1778837020575;
        Fri, 15 May 2026 02:23:40 -0700 (PDT)
X-Received: by 2002:a05:600c:848c:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-48fe60e51c6mr37122055e9.7.1778837020105;
        Fri, 15 May 2026 02:23:40 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767cb9sm13027286f8f.2.2026.05.15.02.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:23:39 -0700 (PDT)
Date: Fri, 15 May 2026 05:23:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v4 3/3] balloon: add
 VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE
Message-ID: <20260515052118-mutt-send-email-mst@kernel.org>
References: <cover.1778140241.git.mst@redhat.com>
 <b29dee815f250b3332651a1a5aeabc4e49ec6914.1778140241.git.mst@redhat.com>
 <CAAjaMXZggBhThMSrR8-YWx=AZDi00hm9or6CSB+v3xgjvbaotg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAjaMXZggBhThMSrR8-YWx=AZDi00hm9or6CSB+v3xgjvbaotg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: t00A3T2kXNxQq_uZNeltpbSmVT9bD7yJBpFbGS_RfxQ_1778837021
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, May 15, 2026 at 12:09:24PM +0300, Manos Pitsidianakis wrote:
> On Thu, May 7, 2026 at 10:52 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > Add VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE (bit 7): the device
> > initializes inflated pages and returns a per-page bitmap indicating
> > which pages were successfully initialized.
> >
> > Update Security Considerations Data Integrity subsection to cover
> > both DEVICE_INIT_REPORTED and DEVICE_INIT_ON_INFLATE.
> >
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/242
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  device-types/balloon/description.tex | 73 +++++++++++++++++++++++++++-
> >  1 file changed, 71 insertions(+), 2 deletions(-)
> >
> > diff --git a/device-types/balloon/description.tex b/device-types/balloon/description.tex
> > index fa33105..7afdb24 100644
> > --- a/device-types/balloon/description.tex
> > +++ b/device-types/balloon/description.tex
> > @@ -52,6 +52,9 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device / Featu
> >  \item[ VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED(6) ] The device initializes
> >      reported pages.
> >
> > +\item[ VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE(7) ] The device initializes
> > +    inflated pages.
> > +
> >  \end{description}
> >
> >  \subsubsection{Feature bit requirements}\label{sec:Device Types / Memory Balloon Device / Feature bits / Feature bit requirements}
> > @@ -249,6 +252,10 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Balloon Device / D
> >  and before detecting its physical number in a deflate request
> >  and acknowledging the deflate request.
> >
> > +If VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE is negotiated, the
> > +device MUST NOT modify a page after reporting it as initialized
> > +in the bitmap.
> > +
> >  \paragraph{Legacy Interface: Device Operation}\label{sec:Device
> >  Types / Memory Balloon Device / Device Operation / Legacy
> >  Interface: Device Operation}
> > @@ -672,6 +679,67 @@ \subsubsection{Device Initialized Reported Pages}\label{sec:Device Types / Memor
> >  If VIRTIO_BALLOON_F_PAGE_POISON is not negotiated, the device
> >  MUST fill each initialized page with zeros.
> >
> > +\subsubsection{Device Initialized Pages on Inflate}\label{sec:Device Types / Memory Balloon Device / Device Operation / Device Initialized Pages on Inflate}
> > +
> > +When VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE is negotiated, the
> > +device initializes inflated pages and reports which pages were
> > +successfully initialized via a per-page bitmap.
> > +
> > +The driver appends a device-writable bitmap buffer to each inflate
> > +descriptor chain, after the PFN outbuf.
> 
> Maybe we could say "page physical number" instead of PFN to stay
> consistent with the rest of the balloon spec.
> 
> > The bitmap contains one
> > +bit per balloon page (4KB), where bit N corresponds to the Nth PFN
> > +in the inflate request (0-indexed). Bit N is stored as bit (N mod 8)
> > +of byte (N / 8), with bit 0 being the least significant bit.
> > +The device sets a bit to 1 if it successfully initialized the
> > +corresponding page, or 0 if it did not.
> 
> Does this mean page size cannot be larger than 4kb?

With legacy balloon, pretty much.
This hack of sticking right-shifted PFNs in an outbuf
is a broken interface that can't even support large guests.
If someone worked on a better one, would be great.
But for now, this just supports zero reporting with that.

-- 
MST

