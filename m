Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED143081AE
	for <virtio-comment@lists.linux.dev>; Mon, 27 Oct 2025 18:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761588494; cv=none; b=SdIBLETaEE+fUnJeOrMPim+koJancwkTpqYzX5Y3ddKSMcxqBmOudI7mUDG24stiuMrn5a2eu3jBEaj91qzMuLbmS8g4Vo6WVaQoXmuofqMqopIqXucuoI4qrWumK7RMRD3FEEbtyM+w4MDTdTlqHLfsSDM4+CLdRn6VK00664g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761588494; c=relaxed/simple;
	bh=iTgacUyf7Ub3mQV2k2pP2QM/PsOyNIsCh/gTC4XhJg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Hb6T0XkNIw6Jb+DU/HYuxCLcJZr2hCozAW4S68w5W3JlXms0J0zVjjYRVWhXqZkwHMWwWLlfI8sLD7JSTLEFCuAOur0TbNfW2bXJWOW8JB/GFhtKKpT6oVVlwyCwu4Q6meZu28FASov2+H60ABAA1ltjNEarg0vvUYeM1oJ2QPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M/KEKf55; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M/KEKf55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761588491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bXs1owQVEmu9C1L0xdPJ4bc5+sDIp1cNxw8y9B0oDcs=;
	b=M/KEKf55Am8oHjHydIZpd0VpZLV5tU5VANn/wjRjMoHKHeSU3Nuw7uJz37R3UOMCi0V+7z
	B0HwvZrOuDbrtIW6tXuCp6QcG9O0R6fkh94cSUkA2yBCygY+58PDG0OZ88f0HADx07Ung4
	lMXC6HeOcIlgOmz/drDNkp2Tpyi7nBI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-6aDfL8cxMWi_yKBLSXiN5Q-1; Mon, 27 Oct 2025 14:08:09 -0400
X-MC-Unique: 6aDfL8cxMWi_yKBLSXiN5Q-1
X-Mimecast-MFC-AGG-ID: 6aDfL8cxMWi_yKBLSXiN5Q_1761588488
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b6d51061554so619470466b.2
        for <virtio-comment@lists.linux.dev>; Mon, 27 Oct 2025 11:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588488; x=1762193288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXs1owQVEmu9C1L0xdPJ4bc5+sDIp1cNxw8y9B0oDcs=;
        b=vXx6b1o9EZaCR2cHOaHBh8Pj/kwvWSHbGuRHhuAuT2km1cVeLDntTolkHIUla32cCW
         jgiRh8+DnuGU/BizzHVaHFyfBF0lJ7NpuLBoGNEddWfoW3mgQzjG1nEe9rsh9OSoKlLb
         6hBXUHHDfffVQ7lWs0R4/SjOJCwARKHn8Y3b/nhxMF2KHOzi14R5bLQoMOPvJH+DQ8fq
         fM8vxtXxRse5SGMHqDJXcNQG9GCRsT/pYduO9ar02BKSFhXHVExazB7crSIdDNgMnIiQ
         RF/mj8ICj0D57tP09Tszw2Dc14YSPxFHK2PILjFBjV7wvxyQ5TClg93NzD29Kab+X4YS
         uWJQ==
X-Gm-Message-State: AOJu0YwLjQKk8oGJONe/8RwguOg9VoOlZGRfd/legznJ1EFZsUqt9rpj
	FQuF2qabDDysGLdTuf1sP9ISgMgS0imAvc06NK2/jCdJTipXRM2ODN+Qrj1Qtg4a9Mlbjg7MZk1
	0xV+RS34oRxW4x5MvLExisN1OngvO+Lcb9CU8B7mzx5DMvmRXiUYlEEnY8NVGHN+n+WmS
X-Gm-Gg: ASbGncv7IC3TR38njgvbpeOPr8H1kMOqzE2C8Dd8ihKAXlX5siR/fBq8wCQRzvmmkNP
	5V7MOYsb5gIZCr/cWEGwjCc3cHt7NgoIn0Zi5lyreQswCPPrLB8EgfkOmP8ED2tljtoT9E+cUZt
	Mo35BiN7KId+IgcJIVGtX2uqDKDKuSW6YlmDQXiWKnfOdcVDnSju9DUx+njY8CQd2h3F0EUv8ck
	ulWqgATy2obvh/zjklMbK9OIA5dg5c8lLIfxZcHSyWEqz646UU6kYhsnKK4s1cmnj15kEsxSDnR
	Krz+vuxzpHDpYayZT1PTjM2OTpTV4IpuICS9Z1KEKd0X3UY7UeTe+nChYfT9VOPn
X-Received: by 2002:a17:906:4fca:b0:b6d:5c4e:b09f with SMTP id a640c23a62f3a-b6dba460ef8mr87618066b.5.1761588488336;
        Mon, 27 Oct 2025 11:08:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEec3Ac7AUibljZ4JOLtbCtvU6qfiJrbBwQZz3cgA9ED1X+yZbEBr69gk9W1uYw1B2lZZcVIQ==
X-Received: by 2002:a17:906:4fca:b0:b6d:5c4e:b09f with SMTP id a640c23a62f3a-b6dba460ef8mr87614766b.5.1761588487902;
        Mon, 27 Oct 2025 11:08:07 -0700 (PDT)
Received: from redhat.com ([31.187.78.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853077bcsm840208066b.13.2025.10.27.11.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 11:08:07 -0700 (PDT)
Date: Mon, 27 Oct 2025 14:08:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: Re: [PATCH 0/4] editorial: Prepare master branch for 1.4 spec release
Message-ID: <20251027140726-mutt-send-email-mst@kernel.org>
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
X-Mimecast-MFC-PROC-ID: ake-zQONKWfNzA5uVnQ0XHF7R1Kn59YRcMgSAb1UOdg_1761588488
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

we have this so it should not be in the diff

\begin{DIFnomarkup}
\begin{longtable}{ | p{0.15\textwidth} | p{0.05\textwidth} | p{0.1\textwidth} | p{0.70\textwidth} | }
\hline
\textbf{Revision} & \textbf{Date} & \textbf{Editor} & \textbf{Changes Made} \\
\hline
\endhead
%\lbrack Rev number \rbrack & \lbrack Rev Date \rbrack & \lbrack Modified By \rbrack & \lbrack Summary of Changes \rbrack \\
%\hline
\input{cl-os.tex}
& & \\
\hline
\end{longtable}
\end{DIFnomarkup}



> Below is the version I am using for last sometime.
> 
> latexdiff --version
> This is LATEXDIFF 1.3.1a  (Algorithm::Diff 1.15 fast, Perl v5.34.0)
>   (c) 2004-2018 F J Tilmann
> 
>  
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

