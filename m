Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F76E32B994
	for <virtio-comment@lists.linux.dev>; Thu,  6 Nov 2025 15:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762444249; cv=none; b=JanDH/6P9krW8POIB5GSXy5bffIDdp3OFhXdzTlPguKiWnmz0jNixcny8tvkRhYAkROqwmqxEfC+omzmsfRhPu5sYAXFfdxCBWyxX+WvHVPggw3RpCzUwlZqzwUoO70wCermQkFlGg+n85bzpCF8lQdB2Q9beeybyLqEnH0xseA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762444249; c=relaxed/simple;
	bh=LswQnFaiFhpct4R3LF4g1eDFV7D70Ar23b1HMwf1J1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cyPpduOpAqh+7DDYZu6T5ld0g+HoBUmxovcu7mFGJjD8bbdz9nUMsMa1WbzeGEn+CYUsU37CvD8LHrs0c/vr54HjYbAoCd4SBwo2qAfOmUCbyYpraKNA0p3wHNK5CYfTURXFAJbOi0F/gXqZogYh81pc/lEISF6oYRBmjuxLGNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CErmiYBw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CErmiYBw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762444246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yLHhvilunxuk7vuJj7zGJpVr+n48UUls8/boTcOZ7QE=;
	b=CErmiYBwDdH5RJmfWoN3RpqB/JaAOzrO617JEmWN7pV8GIf+D7qw9PmF5dYLuarUPqF/NQ
	mLaZAbhNk4muo3RHXUKcC1M5W/N71n3F4uZgcPtCBWvEbltlhDJRzKM5lD7wTaM9TeBL4t
	ksOFykDaUEIQlSAH7PsWKQnY5IQw1Yw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-J0PgyvjEO8-_uc8nFY40JA-1; Thu, 06 Nov 2025 10:50:44 -0500
X-MC-Unique: J0PgyvjEO8-_uc8nFY40JA-1
X-Mimecast-MFC-AGG-ID: J0PgyvjEO8-_uc8nFY40JA_1762444243
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-46e47d14dceso5194115e9.2
        for <virtio-comment@lists.linux.dev>; Thu, 06 Nov 2025 07:50:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762444243; x=1763049043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLHhvilunxuk7vuJj7zGJpVr+n48UUls8/boTcOZ7QE=;
        b=wj5/Bv+6YDVkDq4ExReaeTS7NU+Mw9Vw+N8raZotCvUOJ3aTmsQBknGLf0TBb9CT6H
         3RDTc+qgUuwckmc5vG82wv+Jmffkl1hh4mzW19aj0qj7A7XOrAqxaEtc58gvIfdcKeSf
         g3RqV5fdHImQAWt6VODYGql2qaViJxxPs3aB3AzoBCFOMmyqY54FCm/san2mMgKrJR2z
         BFWSEduhnelUDeGGRDcu9d3G96HFw8uohTflSeHLNHYwUG8ztKKvrnJa4/9DNfov5isv
         Kw95YucuA4znWlbImLwKtCyXP+0MIAD2RHsulG0nSf/rvjug68GqjiGVhNJlf13cyDTR
         2Y9w==
X-Gm-Message-State: AOJu0Yyk7nR/jE4RyNYS30eLiVAv40ECjIkJbuhB5AOXIoJVRDah+hdw
	NqOEaapMSxoAHMPpcqB0FPecCbu+572VA43uOOvdsjVWoG6y8psyv5WDKZV8+Nl4MCSM026gDmd
	gNjCV0SKPdGPS6lWiIhX/j1icjl/yTMmbOmiOITbZTo1J8sYzU6wgGFmFIfa8pt7cQKbG
X-Gm-Gg: ASbGncvF+LaQFLEp/5YGHQOIiAFK9RqTc/q6fbZr2H0LddlaNPFfjMfr0+ATgFzrRtt
	jGtkbEJw/862G9ydF906wr6ds73rFArFvoPSDtxkihYh/2sXmG7SJXsZfOSvRUY1s/a14rE6r3d
	IxAYnhSfxo1dzvG+cpAMvgORK8+aDEt7OmUkysvHSE1MXC8aKbBhH5NclF+co/TCCMqH3sYMly8
	3bUiKvADdUyuBDQ9pVA+HTRYfOxCxbvtVlWJi6V9xjockD06TlhwOZz36DucoW7/JYfk/A7t/pO
	aJUHzNv7mZ+chTzVHnNC+waWrjhkkeJx+bAkaOVIuKuPfdiQBS3CuwVF2+wEwzyczNk=
X-Received: by 2002:a05:600c:528d:b0:46f:b32e:5094 with SMTP id 5b1f17b1804b1-4775ce15009mr90052545e9.32.1762444243168;
        Thu, 06 Nov 2025 07:50:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFE5aF93Y8vqHyppVXP0/I2seF9Yz1W28z5l0HxR/z3RTP63Nc8HHB0he4o+7OejSGAPGwC4w==
X-Received: by 2002:a05:600c:528d:b0:46f:b32e:5094 with SMTP id 5b1f17b1804b1-4775ce15009mr90052175e9.32.1762444242594;
        Thu, 06 Nov 2025 07:50:42 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1536:2700:9203:49b4:a0d:b580])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477624f804esm55131595e9.5.2025.11.06.07.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 07:50:42 -0800 (PST)
Date: Thu, 6 Nov 2025 10:50:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: Re: [PATCH 0/4] editorial: Prepare master branch for 1.4 spec release
Message-ID: <20251106104848-mutt-send-email-mst@kernel.org>
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
X-Mimecast-MFC-PROC-ID: LpmLBSOcDLr_t4e06MVPpX29tAJsCRPj60l0ADXvAWA_1762444243
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
> 
> Error:
> Overfull \hbox (1.18391pt too wide) in paragraph at lines 25449--25450
> \TU/lmss/m/n/10 MUST set the \TU/lmss/m/sl/10 leap_-second_-smearing \TU/lmss/m
> /n/10 field to VIRTIO_-RTC_-SMEAR_-UNSPECIFIED, VIRTIO_-RTC_-SMEAR_-
> 
> This error is similar to the fixes you made in past in below commit.
> But this time it is not in the label. It in the usual text itself.
> There is so much of similar text like above.


Oh I misread. overfull box is not an error. Normally it's a warning:
text goes out of the box a little.

The error is something else, this can be ignored for now, unless we
see a layout that is wrong in a major way.

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

