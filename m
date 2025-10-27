Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469A92E0926
	for <virtio-comment@lists.linux.dev>; Mon, 27 Oct 2025 18:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761588414; cv=none; b=TChunx6PFoATOvdSH45FX9HuLY0a45hnFhCrgWU6I8InNNkXqLkdEjC6MTO3/Vxx8drbR+0dkmJkaI5pJwYRcpZ3L+P1J+SLGRpanwHu8JUxlVOFJ15OHS04SlUmr7Bwk9zDsXX1wfcH4cYC5+WltCRSEVRQs7QcDPlPUVM4Ka8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761588414; c=relaxed/simple;
	bh=ksFQyn4m3VoDmcScqG0023nG0LlSEQ6frm4VTfxrong=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=bEwOV2m1QWAH3gBgTwe3nFPADEuVtgskGfJfa7msAVx1sRAd9oowYlp2nm8oyrlpxX/kfYdv5nm8q4o2rlQZmGbPl1JaAjatp2FvE5YuaT68REn+ozSqpCHZxsrXNWRjYSI/l5OtmrHXZNcRsEzQ3VmfCLFa28HFjbejGAVQQqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ed9q3P9T; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ed9q3P9T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761588412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lpbeN3X9Rqoh5OEICCR+Bwzw0hYCAPoFD8iOWKgck1E=;
	b=ed9q3P9TZ8x3w2M7uSYZRgzSovNv0ucQTRJdL10qx3qpDF0/C44oesYmmpUFx+BD2LEsFy
	n2Ay5uhOMBHPU2O2pLvTLLgLoazUQT8ETDTq1GaKTQgzP6n6zP0AKLfGUIykRCFM7zV485
	k2nYOTsAudMApLZUYQ8R+QuRi5bA2n8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314--uZQ_4G1PA6ol_bDDk-oZw-1; Mon, 27 Oct 2025 14:06:50 -0400
X-MC-Unique: -uZQ_4G1PA6ol_bDDk-oZw-1
X-Mimecast-MFC-AGG-ID: -uZQ_4G1PA6ol_bDDk-oZw_1761588410
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-63c074c62b6so7454743a12.3
        for <virtio-comment@lists.linux.dev>; Mon, 27 Oct 2025 11:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588410; x=1762193210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpbeN3X9Rqoh5OEICCR+Bwzw0hYCAPoFD8iOWKgck1E=;
        b=SXAx2XHB916mvaamec9G25RK9uae4duvpwEcLmlughbCb/aI8pF0eWFDB8uhlFX2Zz
         20qdwtPr5krDdAWAjcK/OtLDLJUF4/FUpkTyq4COIeRr2g3tFbnmU1EtGjiL5J8h0m0+
         HRYs24lU93Ve9B1U+L39x8bTLgeJJIceUmsxpR48Cn9rFaNa/T48K66ruSW0eet59kDF
         QhrsP+/++duXAfZou3oyW6wRkGVZQOgibXJxcnxkQu1FwQk0SFfl9apBPPW8rd8WFwzK
         U+TqHCaJ2gZorDmMYgsfNdWozvuK9lC3HibHnu1KklhOIgboUKlOiRXPccr4YW6Y0tow
         s4Cw==
X-Gm-Message-State: AOJu0YxNwBp6u/PFbYYAKM8nRLLZySWhhEBFFxMSPZowBm+PozDCBajs
	7oNgQfgfLxD3ByHMAwY8/R28IMjwQT3n5j1BBEBDdPoKRWRZwTB9hrVfEvChovPHsXYsNmcoLn3
	OJswxsutptIsF9pbApBFOQMbxgA3oUrdYSV982f8hJO1kUgTCGdQukmsCKaZgY9ukwYs5
X-Gm-Gg: ASbGncvSOWpfaEnHWnuzEdPYVTtGJdTJFTrOJzPI+bnYgLUu2T9F1llxE8QK1R5rbYQ
	/cH7srLdhHeST6aPxw3YwfAZQ4QZdpv9kw0Jeo81p/b9GfPhkNCIBcFT2JYlLqOD8HUyAGWocOX
	8HVLunGD9gLKeT6bJfYq/Xoh8bIEvAMf6W4fiysf6xW7+SmUKF26xprCmnmHJrWuVbfgfpS0MkJ
	0NJ2n0qNWRYM16YY+X4KhYlMR7p4yYncn86YfmUZYVF6Gj+YoN6sgp9FW4qjJ5gu8of7SIbWFWJ
	Qf8LUebX4gTQw+ZCbyMGKTm6YBhVXVB7R2y9O5zlDNPpxjIS05NTcw5nn98FDT+D
X-Received: by 2002:a05:6402:847:b0:63e:1e6a:5a88 with SMTP id 4fb4d7f45d1cf-63ed849e9f1mr791674a12.24.1761588409549;
        Mon, 27 Oct 2025 11:06:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPsvrYzLcHwBxob3VSM2otlNNlzO+wtewektk5Y3Pxjgxcd4iH7tpc1L8sbyzrC1VSe7Fmpg==
X-Received: by 2002:a05:6402:847:b0:63e:1e6a:5a88 with SMTP id 4fb4d7f45d1cf-63ed849e9f1mr791647a12.24.1761588409095;
        Mon, 27 Oct 2025 11:06:49 -0700 (PDT)
Received: from redhat.com ([31.187.78.209])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef6c164sm6943107a12.5.2025.10.27.11.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 11:06:48 -0700 (PDT)
Date: Mon, 27 Oct 2025 14:06:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: Re: [PATCH 0/4] editorial: Prepare master branch for 1.4 spec release
Message-ID: <20251027140542-mutt-send-email-mst@kernel.org>
References: <20251027174756.56284-1-parav@nvidia.com>
 <20251027135611-mutt-send-email-mst@kernel.org>
 <CY8PR12MB7195D654CC8553C5B686105ADCFCA@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CY8PR12MB7195D654CC8553C5B686105ADCFCA@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 31xUKTguuWyZ5XaKJCtX3tdUqoPNcV-PpaVP2ddnS0I_1761588410
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 27, 2025 at 06:04:22PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: 27 October 2025 11:27 PM
> > 
> > On Mon, Oct 27, 2025 at 07:47:52PM +0200, Parav Pandit wrote:
> > > Hi All,
> > >
> > > This short series prepares the specification for release 1.4 version
> > > from the master branch.
> > 
> > 
> > I noticed you updated latexdiff module - intentional?
> >
> I didn't. :( 
> Latexdiff is able to generate the necessary diff without my changelog patches.
> Below is the version I am using for last sometime.
> 
> latexdiff --version
> This is LATEXDIFF 1.3.1a  (Algorithm::Diff 1.15 fast, Perl v5.34.0)
>   (c) 2004-2018 F J Tilmann
> 

changelog is not supposed to affect diff at all.

Also I think we need to have changelog 1.2 to 1.3 preserved
for now (separately).
I do not see it there.

> > > note:
> > > makediffpdf.sh still have fails and needs resolution. WIP.
> > >
> > > Parav Pandit (4):
> > >   edit: remove old changelog
> > >   edit: add changelog for 1.4
> > >   edit: Remove annotation of special character
> > >   REVISION: update to 1.4
> > >
> > >  REVISION      |    2 +-
> > >  REVISION-DATE |    2 +-
> > >  cl-cs05.tex   | 2120 ++++++++++++++++++++++++++++++++++++++++
> > >  cl-os.tex     | 2605 ++++++++++++++++++++++++-------------------------
> > >  4 files changed, 3407 insertions(+), 1322 deletions(-)  create mode
> > > 100644 cl-cs05.tex
> > >
> > > --
> > > 2.34.1

