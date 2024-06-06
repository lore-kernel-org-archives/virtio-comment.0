Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C4A73444
	for <virtio-comment@lists.linux.dev>; Thu,  6 Jun 2024 09:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717664751; cv=none; b=ihQhgg4DmuiGPbxrDjhL+dAWL8ZC+bLrVUM0Am5UL3fC978bmKpPvB/Ngh2A11RGwM+fqGBgRIYU5Xgr72AMhp+ZLFcHTmZZo9EecClyt3N3esy04OlRuqCnc5ZZ4n4xODLsBjsp8/v7F9v0V4RVPcQ+IpAtJc4cQ0EFunz3BNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717664751; c=relaxed/simple;
	bh=lmlZxBCSwgRMHVjnyWgbEk9JYSXa52O3PEprzPnrVfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhB2Mp9WaaNJ5ipBn5eTpTp15F/aa63k/KkmIkEVdSAsNge7ZE31/RjXdsfLzNAnDDAsrEsfAGB4zVx9IN0mpGrbulrLeddf7D4KEVXmNG+1CgoRtjFwksMZVRRwEmvw0wsLT5M8pBZf7lCjSoYtMbP5treiQrg/xYHpzxo1P1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oqwzj6vC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oqwzj6vC"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f4a5344ec7so5146845ad.1
        for <virtio-comment@lists.linux.dev>; Thu, 06 Jun 2024 02:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717664749; x=1718269549; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/OMIVJ3yRFpTZSYbeF5vhrQ9ohnjLVfxXZDdG9rR7N0=;
        b=Oqwzj6vCzWHHKH2xQqV4MudHouBjL+jdEAfuyGvGqLoCZAjmNA47Z0ky7ZccBxdG9J
         rBAGVSrdU3EpxE7zCfLG+1or5LHiTFLYzYC8wyeA3nhn38OZIudNZVuTOWpO5f1BRSS8
         TfT0ch09Y5UV3Ki7KfRqSM3ZJH9olXdz4LZk38WyL+G9k2q7l3KPClW0TFbTCw0fnwxf
         qhAotuh+B91KLvZD8HqpGAEXfwXL+5WGaU/gcF9foOm1fcEd2tiX60VK443b7NCAXkVW
         VzvyZGPmyswm+KjmHVulL+9xdyCh2AOmoJyWlID9ZFlSaoocmmI06G6iAT3EBI2bwCTI
         mXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717664749; x=1718269549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OMIVJ3yRFpTZSYbeF5vhrQ9ohnjLVfxXZDdG9rR7N0=;
        b=JBvYwDu+Li3Q0kFUKpD8xP7G+e6Fa73ctH/LIlN2CRC4ujt6NKtaPwAIbNOgpx2Xu1
         8oTwYbilSeZ2pib51QjZeTBRCq86sRjwc+xhxvQ94Cseh3Hx0+bmzh9kXd/9RrGFQQtC
         jQVzHwkIhqRDkQXhxwOQE2K2EbRxvnsmeip5cCGR28N+he117kh70QaYVVF3PXISROcL
         nKTezij8b+b1VEav746frO2RWlNycxYiBV9mktrEpYt71hFCt4G474kwHip6JTg9DNY0
         ZGE0hOs77RyzKkpyvLS4U9iOwwdU4GZCp5KT6i+hlL5L0OsEnNT/swjXIPNrbElb/VNr
         lhNA==
X-Gm-Message-State: AOJu0YwJTI0IY0y2XjBjY2HKrkoWw3z5ls3viwEjrxaifR5GAEOoHPC+
	uw1I5JP4L0BtdfOJ4mB4hF7mXk0oluv4JiE0s5d7/wdtnqdEsSh/1rJqy28NvwY=
X-Google-Smtp-Source: AGHT+IEQa/vdwIolyu2UVBEUpJwW1TguEB/AGenVUJc9PRv09Iefgi++AIhbPykQNKenFcPEog1mEQ==
X-Received: by 2002:a17:902:f54c:b0:1f4:bcef:e96e with SMTP id d9443c01a7336-1f6b8c85cc7mr29569105ad.10.1717664748774;
        Thu, 06 Jun 2024 02:05:48 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd75f2ffsm9675385ad.46.2024.06.06.02.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 02:05:48 -0700 (PDT)
Date: Thu, 6 Jun 2024 14:35:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V4] virtio-transport: Clarify requirements
Message-ID: <20240606090546.5bkvsmst7qowbh7r@vireshk-i7>
References: <19a5f63c2d88f88f76f5cfc94793aa182d1eeb7f.1717492057.git.viresh.kumar@linaro.org>
 <87plsvlgv1.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87plsvlgv1.fsf@redhat.com>

On 05-06-24, 14:21, Cornelia Huck wrote:
> On Tue, Jun 04 2024, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > +\section{Virtio Transport Requirements}\label{sec:Virtio Transport Options / Virtio Transport Requirements}
> > +
> 
> It might be useful to put some kind of lead-in here, maybe something
> like
> 
> "There are some mechanisms that any transport is required to implement,
> and some requirements that devices and drivers are required to follow."
> 
> > +\subsection{Transport Requirements}\label{sec:Virtio Transport Options / Virtio Transport Requirements / Transport Requirements}
> > +
> > +The transport provides a mechanism for the driver to discover the
> > +device.
> 
> Maybe "A transport", or "Any transport"? I think "The transport" is a
> bit awkward if we're not talking about a specific transport, but
> something any transport is supposed to do.
 
> > +The transport provides a mechanism for the driver to read the device
> > +status. The transport MUST provide a mechanism for the driver to change
> 
> s/MUST provide/provides/

Sure, thanks.

-- 
viresh
