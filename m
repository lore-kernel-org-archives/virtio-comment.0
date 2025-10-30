Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA1635503C
	for <virtio-comment@lists.linux.dev>; Thu, 30 Oct 2025 11:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822004; cv=none; b=Wni4+aDBVnb960xkHmL2ZNvCXBQ1M/w4QUcpL1YQ7VuxKHw88ee4AwNXEg3X4kamokqWiRIU7x6FrmZD6chWm4u4BTl7G3aJcgnhQ1u/CpXlKGbBXLVKJTaplFIE6xQHs1KM1hpujy8DKde3FnHh5bfAgH+1CyxdMFklADJGKYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822004; c=relaxed/simple;
	bh=MdDXJR1VvRkGKPwvKkw491KPV+Zsie56wdy8tLTVa0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gDAfxdnbxggMpjUlPhKUEi3JDMazxJXHuxKWEzL/s2dfvjvBL6wM9qViY5j201uMjVskV7LNOEQWyGk1QI4kVBymX8EYGAdDbYZ7+hCX6oPlwuCuYiGI69/KCMVI4q6655pOPUEQEfxlLiVYX8mEiYap3W5Y1o/F04XeNJE7NJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VJ0cz126; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VJ0cz126"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761822000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TyGE4MXrtlg83yW748JMBWWLY1hR6EuQ+cIpKTnKse8=;
	b=VJ0cz126ItfkOiEG6D8a88Q+15nB/xnfj1SRujkXKRV+RBPRPXYOIt6WTKj4bCZvhjVBAS
	Kz1dXCGhphnFsGnB/k2Ajgx/kCTf5N0bPGUyr5hDMnv09D3LPGg12DCDVeks7R1SkWk1gX
	VahDPXrmZ0T8OZPSPDXcHqEb4e+rgr4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-g1gaxbGUP8CbWOANmj2L0g-1; Thu, 30 Oct 2025 06:59:59 -0400
X-MC-Unique: g1gaxbGUP8CbWOANmj2L0g-1
X-Mimecast-MFC-AGG-ID: g1gaxbGUP8CbWOANmj2L0g_1761821998
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b70459876d1so61166466b.0
        for <virtio-comment@lists.linux.dev>; Thu, 30 Oct 2025 03:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761821998; x=1762426798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyGE4MXrtlg83yW748JMBWWLY1hR6EuQ+cIpKTnKse8=;
        b=Z+z66/yxbBpzfq/Z/YCVv+VwqgkREhvuXroAk0woDjrGw6vAzb2wE2uBMX0HAitpOM
         Avu+cIfVlmij5R3yyfvtgLn6rvoTPWGpyN1Oi230ieCPSXgPEcupads6FvmE/x11LUoq
         xfu7DNCjnq1VtRnjcOd/UVU2HbWli/MWfXRaJ5sjkWttMScjo0slC1LSDtyp308OmIiP
         2P1AYHJ6UuHqP3vY7xy5HIniMVBQ+GuxSF89JF3HQuNZLUqUZofHNFNbjXOyvZZ0Id7T
         ct0vaOMKUrG02tZqFxgqBTSXoax1Kuavv2Kw8owUQVTaPBpja6ts86zc4DXFWxdTbquO
         IjQA==
X-Gm-Message-State: AOJu0YwUYH3ktgdnXHjnUtw9NhYnFiSi6KlBk345raxI6qZQbwOeDpfb
	8CC3ZRnbR0vNUOycsfDZ80988RJi6PLTzFhbeXR2d0kvqIgYjqmEVpwZ+ek+hGwV/YoGmhFuAAC
	FmMo8IJzRc1g6igJxW43g/LCZ49zQmcvFz8YLSxBB2dVH0HEQbtqhKxjIU5sKEyz8QIIp
X-Gm-Gg: ASbGncvhna91uwasZ7RqKipnssCIJUDquolMmaQLFzv2Sv6ff/IQUh8MLcsSobAOpls
	4n9ETC2CIAaTVg9Klyt/BVKcCWZK3jTZ9/QtkkJOqY+Iyb/ZDRLL3OnnkIFU9K9P9J5+VQ+5tCu
	4ZMFm6ERBetaSgM0Y+acEjurX4tZpj128b9VcouuoOmTEqsmBca8sAD290D/FBQbuF4xZs45XGV
	Pp6EcgXhSqChYnBfBj28loAYVMmRGr+rAzaTDBpM4XOXfn62Yldvk1Aa7OVMyRHlXdAIqZgmN04
	jA7uTc99fyEqimYUwVy2svmLWmaDD9TknYmfGFUoqrpAuhztFAoQBvH79wUo440k
X-Received: by 2002:a17:906:9c82:b0:b6d:8ce4:ff18 with SMTP id a640c23a62f3a-b703d2ccb4cmr592231666b.9.1761821998222;
        Thu, 30 Oct 2025 03:59:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy77in7pjWQx1NiBHGPZpV+hMvzQFA6cfdRf7azG2QXkunjdAfGMXU+maerNj7K5cYA50ABA==
X-Received: by 2002:a17:906:9c82:b0:b6d:8ce4:ff18 with SMTP id a640c23a62f3a-b703d2ccb4cmr592228366b.9.1761821997696;
        Thu, 30 Oct 2025 03:59:57 -0700 (PDT)
Received: from redhat.com ([31.187.78.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8540807bsm1706704766b.54.2025.10.30.03.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 03:59:57 -0700 (PDT)
Date: Thu, 30 Oct 2025 06:59:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: Re: [PATCH 0/4] editorial: Prepare master branch for 1.4 spec release
Message-ID: <20251030065940-mutt-send-email-mst@kernel.org>
References: <20251027174756.56284-1-parav@nvidia.com>
 <20251027135611-mutt-send-email-mst@kernel.org>
 <CY8PR12MB7195D654CC8553C5B686105ADCFCA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20251027140726-mutt-send-email-mst@kernel.org>
 <CY8PR12MB719580D6E60D535680D89A21DCFBA@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CY8PR12MB719580D6E60D535680D89A21DCFBA@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rwevBcRgFosjoN9lMpDh9PtlPb7i5HW-4qdsev8zISI_1761821998
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 30, 2025 at 10:54:53AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: 27 October 2025 11:38 PM
> > 
> > On Mon, Oct 27, 2025 at 06:04:22PM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: 27 October 2025 11:27 PM
> > > >
> > > > On Mon, Oct 27, 2025 at 07:47:52PM +0200, Parav Pandit wrote:
> > > > > Hi All,
> > > > >
> > > > > This short series prepares the specification for release 1.4
> > > > > version from the master branch.
> > > >
> > > >
> > > > I noticed you updated latexdiff module - intentional?
> > > >
> > > I didn't. :(
> > > Latexdiff is able to generate the necessary diff without my changelog
> > patches.
> > 
> > we have this so it should not be in the diff
> > 
> > \begin{DIFnomarkup}
> > \begin{longtable}{ | p{0.15\textwidth} | p{0.05\textwidth} | p{0.1\textwidth}
> > | p{0.70\textwidth} | } \hline \textbf{Revision} & \textbf{Date} &
> > \textbf{Editor} & \textbf{Changes Made} \\ \hline \endhead %\lbrack Rev
> > number \rbrack & \lbrack Rev Date \rbrack & \lbrack Modified By \rbrack &
> > \lbrack Summary of Changes \rbrack \\ %\hline \input{cl-os.tex} & & \\ \hline
> > \end{longtable} \end{DIFnomarkup}
> >
> Its puzzling. Because when I bisect, after removing the changelog related patches, makediffpdf.sh progresses fine.
> 
> The error likely seems be the 'overfull' part below.
> 
> Overfull \hbox (1.18391pt too wide) in paragraph at lines 25449--25450 \TU/lmss/m/n/10 MUST set the \TU/lmss/m/sl/10 leap_-second_-smearing \TU/lmss/m /n/10 field to VIRTIO_-RTC_-SMEAR_-UNSPECIFIED, VIRTIO_-RTC_-SMEAR_-
> 
> Couldn't try latest latextdiff yet.


play with the generated diff. it's quite readable.

>  
> > 
> > 
> > > Below is the version I am using for last sometime.
> > >
> > > latexdiff --version
> > > This is LATEXDIFF 1.3.1a  (Algorithm::Diff 1.15 fast, Perl v5.34.0)
> > >   (c) 2004-2018 F J Tilmann
> > >
> > >
> > > > > note:
> > > > > makediffpdf.sh still have fails and needs resolution. WIP.
> > > > >
> > > > > Parav Pandit (4):
> > > > >   edit: remove old changelog
> > > > >   edit: add changelog for 1.4
> > > > >   edit: Remove annotation of special character
> > > > >   REVISION: update to 1.4
> > > > >
> > > > >  REVISION      |    2 +-
> > > > >  REVISION-DATE |    2 +-
> > > > >  cl-cs05.tex   | 2120 ++++++++++++++++++++++++++++++++++++++++
> > > > >  cl-os.tex     | 2605 ++++++++++++++++++++++++-------------------------
> > > > >  4 files changed, 3407 insertions(+), 1322 deletions(-)  create
> > > > > mode
> > > > > 100644 cl-cs05.tex
> > > > >
> > > > > --
> > > > > 2.34.1

