Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4245424A043
	for <virtio-comment@lists.linux.dev>; Fri, 28 Feb 2025 08:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740730840; cv=none; b=YDZgD+jKP35ozR7HieHx10D0LEY5ryNhKMv9TqqBT6t4Z8E/XoD5cm/VPWA5sQhupTeCZKoi6A64sRkQ7fRrHA/Qxh6D7fz2uROC24B18P1JLHNYUV2ZzkGj3v0Ad7tag9mLdeuc6LQe+0qv5SMF1727QTJhRCcSp+M0krmoMyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740730840; c=relaxed/simple;
	bh=bgNm0Wk9S1poLPoRoxnJbIn7FgpxX93Nys25PxC5S3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TihB+mThtbdZCxSMEEQ3+qR0nmsOkCUD5HrN/ZkMA0z1p0pmZuZV8lsOdQy93iRrLR3NbejhS6ixSANUR622ehNCyGd+I2hS2BsayPAhKFn0hHsyz2pWySVswKPOZSG11d/IR6fqM5OUyyPEozqaMg8hItGeJGwIRKFZBLogWjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=etsDOyop; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="etsDOyop"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740730838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bgNm0Wk9S1poLPoRoxnJbIn7FgpxX93Nys25PxC5S3U=;
	b=etsDOyoph6C2KIdtDWYb7dmSyzAmfeyGcjsK6B44oUVVkJDcN4sR9WZbeqLLOmNWW7H9Ij
	u+G6MvqC5d5IOWjiCLFCqP/U09ig4QQGqS01AeRFW4agiu9wDKn1AoSIltA+5kH9HxxxhZ
	O4JK+XQW4ttkg2Fq+Bczy+2YjhlCGBw=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-KEGWybhxPBGBfDc5MEfpFQ-1; Fri, 28 Feb 2025 03:20:34 -0500
X-MC-Unique: KEGWybhxPBGBfDc5MEfpFQ-1
X-Mimecast-MFC-AGG-ID: KEGWybhxPBGBfDc5MEfpFQ_1740730832
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2feb47c6757so2291566a91.3
        for <virtio-comment@lists.linux.dev>; Fri, 28 Feb 2025 00:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740730832; x=1741335632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgNm0Wk9S1poLPoRoxnJbIn7FgpxX93Nys25PxC5S3U=;
        b=MeYnanDGEYpy6dSdxFHTa5Wjh3cZXj5WdbUxzgSvw4t0j4lVwopJSVdVzb5EftindG
         j45oi0f4RWVQyo2sq1P6JzAeGn8IsLTcFnBT8bKaw+fhqDgo2PRkANUOzirQFO8Inx3L
         IHfHF6UB4t7ckrhzlr5mO2p6A0xwJqemhqZ7x8D8VXy7kcUoIK+wV13FzBe8Jm/XOnep
         2s4hSFpedzNCWYlSphxytl+0zyipfM/yt7wFOQi41hSosYQB+ObHZ6g0NXQME1XXTBFm
         zkweCNDViU6E/fvr08s0+os5eh3bJ/B2dfqZPPJrdxWd90frxmEM2sofkfgu67pAHJxk
         K6+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqHynV+PWrJbRLX4Y0RXFD+aXgjCm5S3yZEcKLpsAS4h4PBgv3dSsSq1L5AP6gTPiBa5nqanSbPDH/1jzJDw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxM5mGF+bkh1ntjlfto9ZaVcPbhEcrYJkjeDOzq5kbhe9Zgr8UM
	XV6KwlMaGcQfA6g6oVSDfrJYqeIHBwGEHIh0ELWYTwBhPu81wHSsPivEZQWEdnfkaQWff8fTiXv
	2bcA1iTACQHXoY2w+IdhxJms+VARxiTBT8Xx7Luir2Zn+JUFn/gP3qtlI3xAW5hYAIeo8051FU6
	4D2OFNAZO2xPrnSe46f2gtw5k/WUKMln6G0oX6rto=
X-Gm-Gg: ASbGnctDPfy67droy/winnYU+ntRraS0b8Fyp6jjHUTGo4Jat40XkmXDb8XlcoMisRv
	rek7cRaxNpQyLZqnP7UH7Zh6UPAkA0IZsIQUOtSu7xy01DsUlimp9/RuihacH5U87sFpQmptHAw
	==
X-Received: by 2002:a17:90b:1b06:b0:2ee:bc7b:9237 with SMTP id 98e67ed59e1d1-2febabc8023mr4105266a91.27.1740730832385;
        Fri, 28 Feb 2025 00:20:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+UgnvFAmaVn58kgl3mIcTZVT+uxNw/bUmDFooh+HR1wQuOycLLUfIKTABq3gdNWwAwxFfVwdgAFwK5SV6dHw=
X-Received: by 2002:a17:90b:1b06:b0:2ee:bc7b:9237 with SMTP id
 98e67ed59e1d1-2febabc8023mr4105235a91.27.1740730832036; Fri, 28 Feb 2025
 00:20:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250217172509.107212-1-kshankar@marvell.com> <CACGkMEubUH6YtZHK7sEjj6fvWZ5_k0rQ9H6U2Li4GP0Txi-yJA@mail.gmail.com>
 <CH0PR18MB426010C71F7B3681C14C6F95DFC52@CH0PR18MB4260.namprd18.prod.outlook.com>
 <CACGkMEvZ7YfQr262Qe_ocsjN_ULeqh_sHkJqeqAaOoqOy7OoVQ@mail.gmail.com>
 <DM4PR18MB42695701DC0DB5AB4FABE902DFC02@DM4PR18MB4269.namprd18.prod.outlook.com>
 <CACGkMEuUsQuQ5zNu=kqdTQ9-zWsNc3zdFYVre03fuNnE6tKjog@mail.gmail.com>
 <DM4PR18MB42695063456CE2F746EEDB0BDFCD2@DM4PR18MB4269.namprd18.prod.outlook.com>
 <CY8PR12MB7195255494ABF756FE5414FCDCCD2@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To: <CY8PR12MB7195255494ABF756FE5414FCDCCD2@CY8PR12MB7195.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 28 Feb 2025 16:20:21 +0800
X-Gm-Features: AQ5f1JpExpbT6b8NnQF04jqEBl9099h0UNjOevyU0JZVcyAUlve-MMKsMSNTnlc
Message-ID: <CACGkMEuhgb2TOwJmxOzy7yQTwY65WCJ=88s9bBj4oN+WQGzvEQ@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new field to
 indicate outer network header offset
To: Parav Pandit <parav@nvidia.com>
Cc: Shiva Shankar Kommula <kshankar@marvell.com>, "pabeni@redhat.com" <pabeni@redhat.com>, 
	"willemb@google.com" <willemb@google.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>, Jerin Jacob <jerinj@marvell.com>, 
	Rahul Bhansali <rbhansali@marvell.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G4mD3fg99QwlQBk-QHUpkfeVaZXhU8cU2WXHYhCgOpU_1740730832
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 6:20=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Shiva Shankar Kommula <kshankar@marvell.com>
> > Sent: Thursday, February 27, 2025 3:19 PM
>
> > > New fields were added when new features were added. It doesn't harm
> > > too much as long as it doesn't cost more than one cacheline.
> Have you considered to having fixed vnet header of 64B size for this + an=
y new fields?

Yes, this should work (or even the vnet header length could be
negotiated to match the cache line size).

> This eliminates the existing problem where a partial cache line can be wr=
itten for the vnet header on rx path.
> Because the data is typically written by one DMA and vnet header as secon=
d DMA as they originate from different sources within the device.
> A device can always do single DMA too to avoid partial cache line write b=
ut it does not seem practical enough.

Right. But I meant it needs to be addressed in a separate patch.

Thanks

