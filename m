Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B606155CAC
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720689817; cv=none; b=tj2POr8BzpnQb+E4xi+w7IlsZNzt05Hwxo6R5MQTypOgjGnDjDLhACKTdz/3EIxT9TVE/zOoiwDSHVdhlTMRlv1SaLfrXETMftw1LuXB8hyaXcl6hYk+977DaOdFiLWNGqUya1GwaSdcBtaHSfT6V4UkobqgyBJFEOdwkEayFGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720689817; c=relaxed/simple;
	bh=wUc/ne+EwhV1us2NOBLbZneAsyIPu0r82TMpyzjZv2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gfcRtgglXIrUe709JYwXwt8lUQaGbLXgpVGJttSO7i00G9vr9Ff+BwMA90AQWbhRt9mhj6IcOe4kmgVk/wLBdeWGvChBJkM9A307kvG9JZQcNMVTSIEwptAKG4xRMTBEv0fvF3HMWtvY3YFJGosMKU3wNwyXOXpmRfa86NPiazg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cYWw6bJa; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cYWw6bJa"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fafc9e07f8so4599455ad.0
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 02:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720689815; x=1721294615; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rjbd5p9pBSqj9EQwLPbeK5fKkrs+hiilxFVlQ5KwBXE=;
        b=cYWw6bJaw/Dnm+CDeomtQ/kzgnWre/bNVlhMMPkY3nKynMzRhbpOe3uANxvSbLDeSk
         YABVj9O1OyJlRT2pMMLyruKJnos+FAKHN/TAE1q3i3LAwP71LAe905iMeQvgA246wMBd
         yW3leBCXRGz+9GWHhkAt3NrUsbU/hkDFdiiXtsWnwG84sqYQPhjEf0LpHDQE3MaeLI95
         ULzaBRFU321I3ulzEhtFe0YMZzfIdXd2jH5lOj3znYQ0QU+xVSwe7DWUodOCFmgtprwn
         fuVR5TMYKSZCxgrhl3k5jGG3cjBLYc0VFrb/XlfJUNKb+8pkrzd0DPMOLJSe7LxFri0P
         4RUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720689815; x=1721294615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjbd5p9pBSqj9EQwLPbeK5fKkrs+hiilxFVlQ5KwBXE=;
        b=n32KLT6j5AXjGhkBosMuJHrMsqZOW+2LkfHvx4HSKqX09EYYbq0lM7ZgpB0TXsezER
         ksCIeQOA8ArOUCritF45xwMPfMSU9mz9++9f8v5AIdmDQGrVcsTVIFSBXVzEnMn1Fh0q
         3btP4YhZTXz7tyYSBRLWGWLrA2k+FJIkXgfYWgzUE9fV0mDMHLgmDHi2wbwEHn1wGS29
         EqH5bD1cqUL+VvE9rayYYjZpGSKHeHcNn1jlYq0rX0coRycDadyM9OB9A2zheOBS2PJG
         q4aZD5KKwipL0T48AGeYCyOJ9mmc77xLOQbjY4yysl83Eo7p/497OxEgJDx7XfUb7xRa
         cVMQ==
X-Gm-Message-State: AOJu0YyYFNSeKyMApyviy6A4izAVHXBjZdb+srTer7dF2cFx+/B0I3IE
	KyJAyO48Em74GS+RfdDciG2Wsa16kPioL4r6TgbmzeTlCCdAJ4iDfdiqat0m/6eWH5D4UXFAKc9
	c
X-Google-Smtp-Source: AGHT+IGqdmt0DXQJjucVfCunVPTfes1fDQL4ZrJjrdchIfycMYKb4R7DchbFsrMiSKEbMkL87Xf0Ng==
X-Received: by 2002:a17:902:f70c:b0:1fb:8e00:e5d6 with SMTP id d9443c01a7336-1fbb6d4c3ddmr73212085ad.34.1720689814848;
        Thu, 11 Jul 2024 02:23:34 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a10936sm46212825ad.57.2024.07.11.02.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 02:23:34 -0700 (PDT)
Date: Thu, 11 Jul 2024 14:53:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <20240711092332.uf5n4sbzke52tf52@vireshk-i7>
References: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
 <zzzc2nvseptvarhpwv5vckka5yvtptgebufw3ll4oe2yascfek@5so5pdt4ur7w>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zzzc2nvseptvarhpwv5vckka5yvtptgebufw3ll4oe2yascfek@5so5pdt4ur7w>

On 11-07-24, 10:41, Stefano Garzarella wrote:
> On Thu, Jul 11, 2024 at 01:18:18PM GMT, Viresh Kumar wrote:
> > +A transport provides a mechanism for the driver to discover the device.
> 
> I agree that this would be desirable, but for example IIUC the MMIO
> transport does not provide this, in fact we have to specify to the kernel
> the address where to find the devices.
> 
> Should we put it more as something desirable but not required?

What about:

A transport may provide a mechanism for the driver to discover the device.

But I thought I am required to remove all occurrences of
should/must/may and use direct speech. Maybe "may" is still fine ? :)

> Having said that I don't know whether to use different words or split
> "Transport Requirements" into 2 sub sections "Required Requirements" and
> "Optional Requirements".

-- 
viresh
