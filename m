Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5172E5B0D
	for <virtio-comment@lists.linux.dev>; Mon, 20 Oct 2025 09:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760952991; cv=none; b=IQPPV+Iou3OYE92aq63UlVR636x33C8vADxcFadHx82Uox+tI5zqTdz2AzvvgNX/7OVOo+dMEKiI84RbbkkWc8uVXnj68QyXY20RLcPO8UUu2jwrF/DM9PWpNSobzsOqZi45U1nQ2t952RsCLpvs/LLtGbZzvuf3FoERSGPk2t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760952991; c=relaxed/simple;
	bh=us79lWQeBTbDBLo5BcS1EGtUxo9o0U44f0iErA/gF/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cXDwT4C4KGfM72b3aPeK3u0cbHWjJ4VFupKmjr91iBRswClgtc5BziX5UNAlK0MqBvbAIXV2p3uAycwS2MneSkWBMTsxVqK2AcTULdDZ9HKRHRu5h3fWGaBmf+3qHWHGjtdDX6OT2Chgd1H2+fYcJxKiAJjnf9ctERmlhisKV9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eKV8aI1e; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eKV8aI1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760952984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uqAg2ABDQaNQQyOvGWUL5bwr1wSJ4dOtMhARMSTBvPk=;
	b=eKV8aI1ex/5Odwv7HOPU9TlzZJPJ4AFQeihzwzkL+pKcNiQaAo+g+OePetg81qDu2sBR0q
	H83N5qcR0EE8LW9heRVDD3CEWShUCOQV+uFWQV0/duKjww707UYgxCS+39Q/d69G0LhQkG
	WujJ/tamdx6FPLEPfCn5it89387up/I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-njrf0-ebOnamNbMLibySXA-1; Mon, 20 Oct 2025 05:36:23 -0400
X-MC-Unique: njrf0-ebOnamNbMLibySXA-1
X-Mimecast-MFC-AGG-ID: njrf0-ebOnamNbMLibySXA_1760952982
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47107fcb257so63670125e9.0
        for <virtio-comment@lists.linux.dev>; Mon, 20 Oct 2025 02:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760952982; x=1761557782;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uqAg2ABDQaNQQyOvGWUL5bwr1wSJ4dOtMhARMSTBvPk=;
        b=n/fovKzfN6QsTHqhmjelEH4joGbcdgNOohvJpmzwrm1I7C6rFPQLDCPx3PAvBfOcy1
         /ZkV3+Q7wD5HTUfAZZXh0Z9OqlxjEJ980U8WkQXRtNemxh4b6GnWFMw05MlZ2Lk/KpGL
         7DheWaP2W2FvH4AIqDCfE2NzUxmPWDbD7myCOqac5cN1VCp/9LekIHKXlEme4PyXHPBI
         9PfyOrdkHNwxEUuqyXD6ps95PdT6AZtk+YOidqjQP/4eke+YE+3FWhd5ayLdTf/r0yud
         K2G0MrpPyzwuE8Vv04vbRCElIYMQ1ELJmAtSiqS57gSSmn33gcvqGTciv3q+MeePg4Cs
         VuWA==
X-Gm-Message-State: AOJu0YzJrNxgTExSjeRHsVss0T7S09EUU8xrt18aVl4wVnmSAwXD0RzM
	kATx9ZnFC4GJ0ErJL1xnb9g9RO75ItWJ4heVS5U2dqFGHwFoV0xVAoi6HI7lr7V3cZKNtQKXOvA
	B2y9hi6zoV/5HQDu8qH7gxuJsMUW6dizoTMEVyBewqNOTEPWRbJKCDGdW7ZgMWqkBr1uQ
X-Gm-Gg: ASbGncssanbbkTM1n14buzduE8Ig0VKolPRgGEI6fVgt90AgJdNpokIS7OXwOm/r9q+
	0ynZdX9u+7g/yFjWHI+T5Psn035dfdg4h2wS5YzprGjezxna6UXxlekfzqHL8mSxKw+IjCIEhyS
	+O1/+GLOoRSMBn5X0hQ8srbTe9uEcBkYA9V4mjCb3ygLVmdGUl3yeXJ55GtlRPLHhXI1HxXccVr
	7vYUx3FHpWWENujNfiW1eYVpxCU2Jt9VhPW3dRCKTklQGmkbp2OMnFhp9gEvRNJeKPm2xzyFpnG
	f4vz534JxssOsf8IqMokSHcgNkOKyZ0XdM3wpiXOnZAwqq1FzyntDLMYaojqTxNVhLaO
X-Received: by 2002:a05:600c:3488:b0:459:e398:ed89 with SMTP id 5b1f17b1804b1-4711786c586mr87335155e9.1.1760952981738;
        Mon, 20 Oct 2025 02:36:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3LtpuQruXDeeOYy9okpCvgY0peQcU+V/aP0acqRvY5N/km8Fvn5JwFz7CMMZeo73CM9rlJg==
X-Received: by 2002:a05:600c:3488:b0:459:e398:ed89 with SMTP id 5b1f17b1804b1-4711786c586mr87335005e9.1.1760952981268;
        Mon, 20 Oct 2025 02:36:21 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710ed317c0sm109752195e9.3.2025.10.20.02.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 02:36:20 -0700 (PDT)
Date: Mon, 20 Oct 2025 05:36:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v3 00/11] QoL tweaks and github action
Message-ID: <20251020053602-mutt-send-email-mst@kernel.org>
References: <20251010162858.4107388-1-alex.bennee@linaro.org>
 <87ikgdippa.fsf@draig.linaro.org>
 <20251019074820-mutt-send-email-mst@kernel.org>
 <87cy6h9awm.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87cy6h9awm.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2lHuBXosn94C5NY6VQJRuQydx7UGN7AdZQaE-rHYYtI_1760952982
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Oct 20, 2025 at 10:31:53AM +0100, Alex Bennée wrote:
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Fri, Oct 17, 2025 at 03:10:41PM +0100, Alex Bennée wrote:
> >> Alex Bennée <alex.bennee@linaro.org> writes:
> >> 
> >> Gentle ping.
> >> 
> >> Michael are you happy with the marking of the draft now?
> >
> >
> > Could you fix the layout in the generated pdf?
> > If we are auto-generating it we better make it look sane ...
> 
> I'm not sure if this is another regression with the latest texlive.
> Could you tell me what version of tex you are running on fedora?
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro


$ xelatex --version
XeTeX 3.141592653-2.6-0.999995 (TeX Live 2023)
kpathsea version 6.3.5
Copyright 2023 SIL International, Jonathan Kew and Khaled Hosny.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the XeTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the XeTeX source.
Primary author of XeTeX: Jonathan Kew.
Compiled with ICU version 76.1; using 76.1
Compiled with zlib version 1.3.1.zlib-ng; using 1.3.1.zlib-ng
Compiled with FreeType2 version 2.13.3; using 2.13.3
Compiled with Graphite2 version 1.3.14; using 1.3.14
Compiled with HarfBuzz version 10.2.0; using 10.4.0
Compiled with libpng version 1.6.44; using 1.6.44
Compiled with pplib version v2.05 less toxic i hope
Compiled with fontconfig version 2.15.0; using 2.16.0


-- 
MST

