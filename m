Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE8138F943
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 10:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772014152; cv=none; b=NZl+uXgU63eBI6QlhJ7dPgiFkRblRa1j6zUcJZoCW0KtSfvRRJ6s1GmWcb4nIJxXlNfkETZVjCvIyxSP04KZ+JYDLsapZznGaihO8Ud4YYKCtAADYRW4dfl37XHr0yGEzBWYdOyK50cR+ohn11R+xKKoHYOrYg+tJEYEbtkgYpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772014152; c=relaxed/simple;
	bh=tyWiEB6OZR8m8l1rYlAn8P6SJcKsUtmyiluybN/3XLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=f51+H8GblHD07x7v/0qMprZTA1ity2vnHCwutU8r5SXqeCzC0lMfvOL1kbdMScdTLInRVZiXSqk5U0OawznmV9P3IDdvQs9QawoX+XM3IyV66sZZXewuAQEsuxVCXKJlzWfMy9TZvIQsCjf4FVi6mXLfRKSY+tEj1naMarDWlSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EfHATCLx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EfHATCLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772014146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qLFG9XbToid8DpG8QTQ16ludkmITsMX+wSe/4/Hi8To=;
	b=EfHATCLxZOCc6tyM9RTzRx5VMRyHcWyj54cOvHgreCs+xpkCICeK4ql07dF6b7S/sS2Tp4
	ieR8sQTlMW/bNH2ugM4hC45fVGbTs1LZIw5H12dafSEjboOnq5Uhopl5eNL39RQslnClJV
	kGMf7OpKHN3M1JK71SF6bXuGP2AjS+A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-WzQqQ5R6M6qKZemLQ8Mnjw-1; Wed, 25 Feb 2026 05:09:04 -0500
X-MC-Unique: WzQqQ5R6M6qKZemLQ8Mnjw-1
X-Mimecast-MFC-AGG-ID: WzQqQ5R6M6qKZemLQ8Mnjw_1772014143
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43985826d05so1301600f8f.2
        for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 02:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772014143; x=1772618943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLFG9XbToid8DpG8QTQ16ludkmITsMX+wSe/4/Hi8To=;
        b=aAiqEcXbBLhkrXU8qu6luMrAPNyd3kow8iYplzsdOi7yS2Qj+q1L5sSLslXgeStPlO
         9NOuJTByeZ3moClHLH0xUMn8fGi4ZVtI0VuAm18oJ60Os89UhpJEr/UEd3MB5VxmM4Ws
         fy6gAWD9s8MtK9qwM2Jb7vtJfphdQC/9nBSsXipbDqPD/ZezE/1s9ZQ+mE3KcILI3C4X
         M3WmD0YR+SG3735qt+E9feYA4xrgKy5GcdRgpKeb7U6wI0ThH+gBd/dKsfkzNfbiuvfc
         yA08lMQ/AA59rN7HztStr7QnKW1BMTxz9PXbRHvBBNwOiHnBlbUfdvgQ2mmKTbdNpqK9
         AECQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrL3XBSCWGYIvv2UscNbHVgastzzRGVJuEurqjCy7d0sTfgywGG2n0NPjdB3Uc6k6qQt4oX7MfMAvH+Ee0rQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwqZY6qNVOBr+jq52YAZs+NQfW5OTV17PQS5B4r0frxNQw19o/P
	hX5TZMgqOhpvbCuXmTWauuza4wG0NTz6//oB7Yb6S2nCIx1IOjv1gWsLsgRIpgxvMw2JCc1X7Nl
	DfBg2Mvi1GBWLJZ23NHtN0Aj/7EbAb3+3J8GvO1qKQLL6IZsZ9DYY2eGQNiHEvWTV7o/t
X-Gm-Gg: ATEYQzypqypnLKEF7HU1BRkx6k5m95iM37K/h1ovHsw3tVtHSAez2fshIEU2W8PcYrg
	9HWMM59MONyFpfRKlvmV9kcVz9kwD/bUF2J504yBwCeskaamNVfcqnTlja5+CAP09XZq06BA85n
	FEAPbBjdNp7O9YZuDRg8Yq1hn0OZ2zF9Rnk0IxE0ec9oKPxGlHTQum4smWHUB10X2c5i5aREs/v
	60A3BZHCjvh559ylV9fg+pot/9XEFbNREXqSyxEOs8/26mTAky35ddsoTvMKDSE1Ss6xYMmjZt0
	318ACCb/5yXPgJwtAs1iGZKHzPQsbqqYtRoYhNp3vdsqOHCFTKaZKRtJz6XCQ4VnrkEX0BNVOdG
	KamoLfv/WyS/y9CbejIoq7ojcaYv3OpfFpzOWf0s4pIZCVw==
X-Received: by 2002:adf:e64e:0:b0:439:8487:73b2 with SMTP id ffacd0b85a97d-43984877513mr8099516f8f.14.1772014143123;
        Wed, 25 Feb 2026 02:09:03 -0800 (PST)
X-Received: by 2002:adf:e64e:0:b0:439:8487:73b2 with SMTP id ffacd0b85a97d-43984877513mr8099470f8f.14.1772014142550;
        Wed, 25 Feb 2026 02:09:02 -0800 (PST)
Received: from redhat.com (IGLD-80-230-79-166.inter.net.il. [80.230.79.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43986aa2f84sm10401391f8f.7.2026.02.25.02.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:09:02 -0800 (PST)
Date: Wed, 25 Feb 2026 05:08:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <20260225050544-mutt-send-email-mst@kernel.org>
References: <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260220050136-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806139282845EA52421A9E2DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225022229-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806E3A4D9783E5DB5FA5EC4DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225041945-mutt-send-email-mst@kernel.org>
 <701B1A68-655E-4ECD-BD17-5784AF7DFE40@arm.com>
 <20260225045338-mutt-send-email-mst@kernel.org>
 <68274D80-562E-44D5-83DD-34BC2D750274@arm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <68274D80-562E-44D5-83DD-34BC2D750274@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jmwEMl4iuwyzgWm-ErHnIvP_r5508kMyIKEMzL6Fvz0_1772014143
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 25, 2026 at 10:01:45AM +0000, Bertrand Marquis wrote:
> Hi Michael,
> 
> [snip]
> 
> >>>>
> >>>>
> >>>> I frankly expect an ARM FF-A bus binding transport section in virtio-spec.
> >>>> So that device and driver can inter-operate implemented by two different entities.
> >>>> Only virtio level messages do not seem sufficient.
> >>>
> >>> I agree at least one should be shown at least as an rfc.
> >>
> >> Here is a link to the current virtio message bus over FF-A specification:
> >> https://developer.arm.com/documentation/den0153/0101/
> >>
> >> 1.0 Alpha 1 version in sync with this version of the virtio message spec will be released later today, you will be redirected to
> >> 1.0 Alpha 0 version until it is  which is in sync with the previous RFC we sent.
> >>
> >> Regards
> >> Bertrand
> >>
> >>
> >> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.
> >
> >
> > thanks. pls include that in the series as [PATCH RFC 5/4]
> >
> 
> We are not planning to have this included in the virtio specification but maintained by arm as an independent specification.
> FF-A is an arm specification and as such virtio message bus over FF-A is arm specific.
> 
> We can reference it as a bus specification example in the virtio specification if you want (as an external link).

Surely, you should. 


But for a variety of reasons, including the fact that they should be
developed in lockstep, and others, please include it in the list with
"RFC  do not apply" subject.


> Regards
> Bertrand
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.

