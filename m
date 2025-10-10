Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437C71F37A1
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 12:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760098012; cv=none; b=AkpKl6fDdPIZG2Yj9G66kvwtxPbWWTfcQseEKujsCyqJa6u73M3eHUSmq0+0LejcJPLR5sP6reZm6mTbwrK6+hOR9il9piBNK65Pbz/sQUVe8XxhWwwVqa06s/VrjqHjF5/mCsTUE9jnrVXR7JnogkzO5gnXiahtbLP0LlkjW1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760098012; c=relaxed/simple;
	bh=RLm+IG0ChQDOtxaIK5g1eFQ2eup+SSOp5Pn7nt+oj14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=HBS3y3X3CLOtdzV/E8I6V07I8xkssw6aIlZrCxnMbe9hXiCTnbpXJxIVDiCBaZZWa0i9dxqY+UaVsD6K7QoPDSgK98xT4K0pW4X1RgbJTgkj9mFrWG+lMYhvGb01B+THpdXwL/2DPWFjqCfwts5SGGF+l66u2ciW+RT8vSMYWh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yb0/1VHM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yb0/1VHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760098007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z7T0Al+VGlBzMruei1Qy1JshdAFTdA4RVVQZs7rpkNQ=;
	b=Yb0/1VHMeBUY/xkJXdDksjkpAlqsXt1a09tTOkPMh0HrG7OCrtdgj0pv627iTwFY7osDfA
	Yxw+eyvCdXIoV4YEMKQBtEJ2T7QuHoram4/qITy3REsH8cj0iNnFblkUatCXAC1UHRehxG
	pcML/BT8BV9vxGWqIzmV6/Br8at1qH8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-aVs3vcWUMsO3ImRlrItuiw-1; Fri, 10 Oct 2025 08:06:46 -0400
X-MC-Unique: aVs3vcWUMsO3ImRlrItuiw-1
X-Mimecast-MFC-AGG-ID: aVs3vcWUMsO3ImRlrItuiw_1760098004
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b41c67edce5so304274066b.3
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 05:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760098004; x=1760702804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z7T0Al+VGlBzMruei1Qy1JshdAFTdA4RVVQZs7rpkNQ=;
        b=wI56/FtEd290WxRxty1fCvxXVYsBcJuS70qDZym6mndteqwxv2NZCqdSMdsvBM+rer
         k08mmZizJFtTjvXUU6CaE5Nv8cQuFWIlifruI6IRhmiVXuQTqduAVyjFCMapvE74u6Ua
         5L0njRYxijoGibPFM2Ia0hKue4uowvZA6/0H4XZyHw1h7//Woz8TXK58clbIJLaoziIp
         Zn+ubdEZJRzYwabIZWfWnMGNMMbnh6t2LW9FalixT4nXLg1KSQuQgZq8413lH+iPP5dr
         sPnFDQ1PRKTLBfvCJa2mc0imdmp7ffsNDrOKrvffAmj7Yo1gQ4Y1bi74FhTFhFzKL3KX
         zQCw==
X-Gm-Message-State: AOJu0YyjKAsBTafcWHiBcFUfGGuSd3Ndr2oFbJgcw9nTMRom4sXJ43FO
	IwjiNBMwQRUQWGpNffTz9VvV5d/qMr6Hw9n0uQmf3PyLeRhrVKOMrNubd9cgZgC/1e0/sgyrGUF
	+hELKqEK0Zpu8tkUUg0wRdRPBOiXNR71mZRFGZCr5BDnyUz1OCel6DSY9d3e36LlplKnR
X-Gm-Gg: ASbGncsjeiknuoQtR/2Q4IVf/bWx1VsyPQeVkQdXyjF2MBl0CdJrHsU3rd8LCBPOyrb
	ycPyNHpGVZVAL2QCeh1oSbcF4A0ZyhdWecWFUmKChZOBheeDrLvbv82q06ZW5xPheCj/YJLyrxe
	Pj3anWMRuGoJkK4FYIl/zqAtdQ5awNUccaKTwfevziNc3/4iFQWcom0bVRqPxsb5AO6WH1Yrv80
	I0i0ouS9MrzxXzuazcbUHX46RMkaGoRJ9LZRrkhQ3DPHtoPQt0ETQY6lAAYxYmu1OZLKamO3NYY
	Z5GdFAg5y25XKuCEwRKfp3V0CrU3
X-Received: by 2002:a17:907:720b:b0:b44:7c83:cc1 with SMTP id a640c23a62f3a-b50ac0cb1b8mr1118257866b.41.1760098004027;
        Fri, 10 Oct 2025 05:06:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmsYXpSzDOJ34856S8Wim4vpAm4sCndxZqj+O3dptR7u7QVf2n4pnb0AXvvG93Ntwg/1kZEA==
X-Received: by 2002:a17:907:720b:b0:b44:7c83:cc1 with SMTP id a640c23a62f3a-b50ac0cb1b8mr1118221966b.41.1760097999068;
        Fri, 10 Oct 2025 05:06:39 -0700 (PDT)
Received: from redhat.com ([31.187.78.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d900bf8csm217703866b.59.2025.10.10.05.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:06:38 -0700 (PDT)
Date: Fri, 10 Oct 2025 08:06:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v2 00/10] QoL tweaks and github action
Message-ID: <20251010080116-mutt-send-email-mst@kernel.org>
References: <20251010112010.3880438-1-alex.bennee@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20251010112010.3880438-1-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: on9ZIm0sW3LQgJxJBf9kxRwfIC6LkFWG8y7rKi5rBeM_1760098004
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 10, 2025 at 12:20:00PM +0100, Alex Bennée wrote:
> Some of these patches I've posted before. Along with general
> quality of life tweaks to the build scripts we also introduce a github
> workflow to build and publish the current working draft of the spec.
> 
> I also fixed a build regression with htlatex which became apparent
> when I upgraded to Debian Trixie with a newer htlatex build.

thanks for working on this!
I sent some questions and comments but generally this
is very helpful. Thanks!

> v2
> 
>   - added README.md cleanup
>   - applied r-b tags
> 
> The following still need review:
> 
>   .github: add a runner to build the latest draft
>   make-setup-generated: optionally add GIT metadata
>   virtio-html.cfg: implement workaround for htlatex regression
>   specvars.tex: properly wrap arguments to \urldef
>   README.md: convert embedded html to proper MarkDown
>   LICENSE.md: convert html to proper MarkDown
> 
> Alex.
> 
> Alex Bennée (10):
>   LICENSE.md: convert html to proper MarkDown
>   README.md: convert embedded html to proper MarkDown
>   REVISION: update to 1.4-wd01
>   .gitpublish: update base to current working branch
>   virtio-html.tex: sort package list
>   specvars.tex: properly wrap arguments to \urldef
>   virtio-html.cfg: implement workaround for htlatex regression
>   make-setup-generated: optionally add GIT metadata
>   Makefile: add some simple make automations
>   .github: add a runner to build the latest draft
> 
>  .github/workflows/deploy.yaml |  37 ++++
>  .github/workflows/test.yml    |  15 ++
>  .gitpublish                   |   2 +-
>  LICENSE.md                    |   8 +-
>  Makefile                      |  33 +++
>  README.md                     | 387 +++++++++++++---------------------
>  REVISION                      |   2 +-
>  make-setup-generated.sh       |  32 ++-
>  makeall.sh                    |   4 +-
>  makehtml.sh                   |   2 +-
>  makepdf.sh                    |   2 +-
>  specvars.tex                  |  14 +-
>  virtio-html.cfg               |   3 +-
>  virtio-html.tex               |  30 +--
>  14 files changed, 298 insertions(+), 273 deletions(-)
>  create mode 100644 .github/workflows/deploy.yaml
>  create mode 100644 .github/workflows/test.yml
>  create mode 100644 Makefile
> 
> -- 
> 2.47.3
> 

