Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2752BD5AF
	for <virtio-comment@lists.linux.dev>; Thu,  6 Nov 2025 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762443750; cv=none; b=L1DquoIW7tOEBkdYDcFmjb9JIN6gEoqWAHSsWi0v0Msg57A4ThWMpjq0z5gYVHVen//MU6QtuC7U+v/g0Mctq7S+cuO9GDQZpeys4DidXxnFLvjsvNWxR9wR3nooDaZZrbEPHhgAqqsjIEEthAuvDQ0ME9GYyMR++ZT3oTvGzW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762443750; c=relaxed/simple;
	bh=v8EAmTyrGaYlDn7niANgeHb6pn9CGFX8Rj2RCsF9U8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=JgBiBacWopbETp0/YbiKKgsQBG1gR2TaPN9pwARZkdd68y65r8jRFDOjsxn6U1H/929KLVBs97484HeVWG+F8ZAS7VNaqdDXqqnUc2QELXHzCesw21KbC3XN39invN7Szux1Jtp9+m1ZN8XXGOM+iWRjIj2zOL7OgfvdUh5RcDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V2GkDKAp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V2GkDKAp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762443744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LUaCzNIhthKP5a1dIOo57y0VEmnIEcNgr+wznWZst0c=;
	b=V2GkDKApsP5LrvN/qvDyzqe/GAi+OphoI4usx7GT62Jhbst4NX0JUDv5w4NNdnzoval71G
	ZHaiPocYNDejibpoOu3KLuTzjK2vM0/rlfzIENsPP7elvHpHiNUUcY+hKjIRoKK15ddK+8
	beyLT4ZIVP4whgajgjm5cCCAR67vVn8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-acxtLDUkNsqAaaGfwylrbQ-1; Thu, 06 Nov 2025 10:42:23 -0500
X-MC-Unique: acxtLDUkNsqAaaGfwylrbQ-1
X-Mimecast-MFC-AGG-ID: acxtLDUkNsqAaaGfwylrbQ_1762443742
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-426d4f59cbcso1642168f8f.1
        for <virtio-comment@lists.linux.dev>; Thu, 06 Nov 2025 07:42:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443742; x=1763048542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUaCzNIhthKP5a1dIOo57y0VEmnIEcNgr+wznWZst0c=;
        b=UPGlYQso8c85LIYuVWGJk16Et9SVxHSGDvGikNCdg79Mo/CbyshMaOtaqhx4NXFHqK
         GNnsYHYW7Wg0Ggud9rJZwQHfQnKGm+7cU8Pln4UJkH1jxuCiJHT4Lvhg8xFr7IB0q5/U
         KVlSPtoDG5tWBaEc2o/aVejsBBMkC7TZ1xnhDYbZWjX/eIy1DENIFnsGdQAQix7FIybg
         fH40aD2aNoKB9K6PCfkkv+DxNqP7PlBLZapzJ3nOCGxIO/HEAgqYrBEa5/wSno+/sKmK
         vDi8xwY2zV2AOuSs8JNzopc6EEqgvWJX6EnSX2CTC/IiLOLSkVemWj6n6oLvluF/aX2e
         /3Nw==
X-Gm-Message-State: AOJu0Yw4/cVcUeMMSFJKrT5LTnaGI0x/yAg9MtReK4W4A6JYT8JGy/i5
	lQKINjs6o9uFrbe1qhIa6EM2fGV/7SFFBIKCV6AZbKY0lnvLlGrMcs29cM0Ko7f1X2d4zE+zcOu
	yJGK832K94gmj68qLKzRNOzP61yD7EbvFqSWMiIl8rRMgJ1wL996kXFebMOYI9N/uXQs/
X-Gm-Gg: ASbGncvG4fYGKw3b7S56Ac30nxQ6fIXEqhXu2lBncNPYr6tGu37OwRmPehm2fxOa6+i
	Um9TrZIPANCvOTqiSF/XHluuVNSRAJq+Ltcy+xjXttIR2jpLYlajA7ASZSnSTjjPWZMaA9xre/n
	VnID34VaXGOknuCLCeVLW2a6MEyad434PbSvQXQUvQbiZHjA3JbNqztJu4CvNNPdNsOYgIGneaR
	mKK7AT27VJ/TH8siqFtkqBH5M6AyWmTynGFo2H4SMsnj+U7JEpero+4OM4kDgHVb8C/kEtCfFZL
	ihLJofQ6/JGbotD6lS6mt9AWQVVakaGnSf9qzvFBiRJHL5+ZjC1G+NRpSRn5lOsMA6M=
X-Received: by 2002:a5d:584a:0:b0:429:d33e:deff with SMTP id ffacd0b85a97d-429eb1aaef3mr3393254f8f.22.1762443742120;
        Thu, 06 Nov 2025 07:42:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENNU24uEWTdx81Al9W+vKUiwtDziriaSgDTIM8PoN+jqDmUuf+6B9CxFO7xj3P0fa2nfvrkA==
X-Received: by 2002:a5d:584a:0:b0:429:d33e:deff with SMTP id ffacd0b85a97d-429eb1aaef3mr3393220f8f.22.1762443741573;
        Thu, 06 Nov 2025 07:42:21 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1536:2700:9203:49b4:a0d:b580])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb4037d3sm5774747f8f.6.2025.11.06.07.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 07:42:21 -0800 (PST)
Date: Thu, 6 Nov 2025 10:42:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: Re: [PATCH 0/4] editorial: Prepare master branch for 1.4 spec release
Message-ID: <20251106103703-mutt-send-email-mst@kernel.org>
References: <20251027174756.56284-1-parav@nvidia.com>
 <20251027135611-mutt-send-email-mst@kernel.org>
 <CY8PR12MB7195D654CC8553C5B686105ADCFCA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20251027140726-mutt-send-email-mst@kernel.org>
 <CY8PR12MB719580D6E60D535680D89A21DCFBA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20251030065940-mutt-send-email-mst@kernel.org>
 <CY8PR12MB71952EC25BAFC10A2CC13E35DCFBA@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CY8PR12MB71952EC25BAFC10A2CC13E35DCFBA@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -41PLEl_BYYaoGDRny-94m1FT9gjhCyKOOw-Y_vntNU_1762443742
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 30, 2025 at 03:15:09PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: 30 October 2025 04:30 PM
> > 
> > On Thu, Oct 30, 2025 at 10:54:53AM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: 27 October 2025 11:38 PM
> > > >
> > > > On Mon, Oct 27, 2025 at 06:04:22PM +0000, Parav Pandit wrote:
> > > > >
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: 27 October 2025 11:27 PM
> > > > > >
> > > > > > On Mon, Oct 27, 2025 at 07:47:52PM +0200, Parav Pandit wrote:
> > > > > > > Hi All,
> > > > > > >
> > > > > > > This short series prepares the specification for release 1.4
> > > > > > > version from the master branch.
> > > > > >
> > > > > >
> > > > > > I noticed you updated latexdiff module - intentional?
> > > > > >
> > > > > I didn't. :(
> > > > > Latexdiff is able to generate the necessary diff without my
> > > > > changelog
> > > > patches.
> > > >
> > > > we have this so it should not be in the diff
> > > >
> > > > \begin{DIFnomarkup}
> > > > \begin{longtable}{ | p{0.15\textwidth} | p{0.05\textwidth} |
> > > > p{0.1\textwidth}
> > > > | p{0.70\textwidth} | } \hline \textbf{Revision} & \textbf{Date} &
> > > > \textbf{Editor} & \textbf{Changes Made} \\ \hline \endhead %\lbrack
> > > > Rev number \rbrack & \lbrack Rev Date \rbrack & \lbrack Modified By
> > > > \rbrack & \lbrack Summary of Changes \rbrack \\ %\hline
> > > > \input{cl-os.tex} & & \\ \hline \end{longtable} \end{DIFnomarkup}
> > > >
> > > Its puzzling. Because when I bisect, after removing the changelog related
> > patches, makediffpdf.sh progresses fine.
> > >
> > > The error likely seems be the 'overfull' part below.
> > >
> > > Overfull \hbox (1.18391pt too wide) in paragraph at lines 25449--25450
> > > \TU/lmss/m/n/10 MUST set the \TU/lmss/m/sl/10 leap_-second_-smearing
> > > \TU/lmss/m /n/10 field to VIRTIO_-RTC_-SMEAR_-UNSPECIFIED,
> > > VIRTIO_-RTC_-SMEAR_-
> > >
> > > Couldn't try latest latextdiff yet.
> > 
> > 
> > play with the generated diff. it's quite readable.
> > 
> 
> Ok. My bisection was wrong.
> It's the RTC complain.
> Latexdiff does not like below line during diff generation.
> 
> For VIRTIO_RTC_REQ_CLOCK_CAP, and clock types other than
> VIRTIO_RTC_CLOCK_UTC_SMEARED, the device MUST set the
> \field{leap_second_smearing} field to VIRTIO_RTC_SMEAR_UNSPECIFIED.


I am guessing it is not latexdiff, but xetex not liking what
latextdiff generated?

So again, look at virtio-diff.tex and see what is in
the generated diff you are trying to compile.
What you pasted here is the original tex.





> Error:
> Overfull \hbox (1.18391pt too wide) in paragraph at lines 25449--25450
> \TU/lmss/m/n/10 MUST set the \TU/lmss/m/sl/10 leap_-second_-smearing \TU/lmss/m
> /n/10 field to VIRTIO_-RTC_-SMEAR_-UNSPECIFIED, VIRTIO_-RTC_-SMEAR_-
> 
> This error is similar to the fixes you made in past in below commit.
> But this time it is not in the label. It in the usual text itself.
> There is so much of similar text like above.
> 
> commit 6c2340547951ada46447c973b1d8133165785840
> Author: Michael S. Tsirkin <mst@redhat.com>
> Date:   Mon Jul 15 12:50:05 2024 -0400
> 
>     admin: get rid of _ in labels
> 
>     it's not the 1st time we find out underscores in labels confuse
>     latexdiff machinery when generating html.
>     Errors look like this:
> 
>     ! Missing \endcsname inserted.
>     <to be read again>
>                        \unhbox
>     ....
> 
>     ?
>     ! Emergency stop.
>     <to be read again>
>                        \unhbox
> 
>     To fix, convert underscores in labels to dashes.
> 
>     Message-Id: <3e773fcfd4246e66e6f39d3be95d2c0335e34532.1721062136.git.mst@redhat.com>
>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> > >
> > > >
> > > >
> > > > > Below is the version I am using for last sometime.
> > > > >
> > > > > latexdiff --version
> > > > > This is LATEXDIFF 1.3.1a  (Algorithm::Diff 1.15 fast, Perl v5.34.0)
> > > > >   (c) 2004-2018 F J Tilmann
> > > > >
> > > > >
> > > > > > > note:
> > > > > > > makediffpdf.sh still have fails and needs resolution. WIP.
> > > > > > >
> > > > > > > Parav Pandit (4):
> > > > > > >   edit: remove old changelog
> > > > > > >   edit: add changelog for 1.4
> > > > > > >   edit: Remove annotation of special character
> > > > > > >   REVISION: update to 1.4
> > > > > > >
> > > > > > >  REVISION      |    2 +-
> > > > > > >  REVISION-DATE |    2 +-
> > > > > > >  cl-cs05.tex   | 2120 ++++++++++++++++++++++++++++++++++++++++
> > > > > > >  cl-os.tex     | 2605 ++++++++++++++++++++++++-------------------------
> > > > > > >  4 files changed, 3407 insertions(+), 1322 deletions(-)
> > > > > > > create mode
> > > > > > > 100644 cl-cs05.tex
> > > > > > >
> > > > > > > --
> > > > > > > 2.34.1

