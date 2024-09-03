Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4351A0BEC
	for <virtio-comment@lists.linux.dev>; Tue,  3 Sep 2024 10:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725359900; cv=none; b=Tbjhe/M/wwIQacZMX99n0BhVMwmbXmYPM985NvHNZyDpTJgqjb9XOrLb93lVQxnA5CPm2iBeTGRw7Z0Q1FYtrFbw2oDiJTqaShPwwhi9FX0uEDxBmKpWcBmvZXLyPFtH7YTq84cOXADUju6iRHcFFDPYxT8HJ7n/kA3tQdnM5GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725359900; c=relaxed/simple;
	bh=v5mtImfqTBwZ8f9vdSDjQh1lyYqpPBx8/sWn7D4UIwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFpYmn1XQy+cOeJUMkpVXYf+TQPNNi5biorE5Adi3jioeEaNEzHkp4lv1ix2oSvwZsQNOR9BwUJdzfiRF7NBs3A3M9q1LH2cUpXz8Iq36xbXMqvr6A/u1RlGadJljG+MYCj+fK/6vva2L4CZDy6NadFdHpiyyelE7od20Bu8RbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G/eJYery; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G/eJYery"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71423704ef3so3813707b3a.3
        for <virtio-comment@lists.linux.dev>; Tue, 03 Sep 2024 03:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725359898; x=1725964698; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zg21DrFdNoNtNmrNpRm/OqJjVaiHs/dvDgn6docoQ7s=;
        b=G/eJYery4GH1jRGCBoeVmWrP2PD9dqx47INFNtZQYQ8XWVc96+2QA0yFg+U4tevi5K
         sFqw0o67u+qljRqDD5RTzZMWMRZ59XU2sBJVxGGTc2tiQiTs9n/AR11UmEd5Z94ouoSp
         67oUxfKuiogHvo7TxL4viAQosDumrF1T39cLBTWvpvGr83kgXuRWVIHwHZ6yP+x0NDHD
         PDwSlbW1pNOjstktPzHJ0jzX9oozUMYJr32XmjWXf4cawbgcf1u/rgxSupEkIyBYNiYU
         oT+UICIa69G384Hkg7WrphpCUMSA/rMVeCq9+uTQZACL14FItqM7uUtUKmpi95VHXP9R
         Vu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725359898; x=1725964698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zg21DrFdNoNtNmrNpRm/OqJjVaiHs/dvDgn6docoQ7s=;
        b=Qk8jjjm8JhXLN2bmN3QYRNM/VsJwR5XjMSSLFZ3FjGzyQfuZKWIUAGs0N+PB7ico9N
         gogrrh7On20sG9z9iTKRegDVr/k95hVS5jceqPf0W42tCCUX1W0+Am6/GWRUU3pim2Gv
         dxrt9ovqyNH9dvGPpgKVZJOxV97lrfOpCzGC33Vacugx7ofPenS5JDSV+ZXrsO0uqbcz
         4bJscCR9RFZvTxNDBYjPyr9aaD82KNxBNKOsqvsS16mjWb95Lq61vprEBE9aNS097U02
         wBe/EQby2OjfJ3f8nDU+BVd9rVUoGjs4flI+VNNpziIIf7ETdqMk6CSV3z69fGJMYpts
         L2UQ==
X-Gm-Message-State: AOJu0Yy/ePpr774jT1vODZpvggSu/i0ho4ZnXisWbyVtmBQsHoEb/XLV
	WJYMeVSNdBnXLgs/wJvaanV6R6WOYUFuPYISi3Zz1JxRrPACPNoFzqCX/heKLHK3MS7hRIF0agR
	S
X-Google-Smtp-Source: AGHT+IFA3HqoUYzI2W9z4sh3rqOoCizwMpWASPrpmnIcCk5R7nRMCKOvEND7Wk3UH9H+5pMA+8Y0ww==
X-Received: by 2002:a05:6a20:43a2:b0:1c8:92ed:7c5c with SMTP id adf61e73a8af0-1cecdfdce91mr12463134637.35.1725359898008;
        Tue, 03 Sep 2024 03:38:18 -0700 (PDT)
Received: from localhost ([122.172.83.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e743252sm8842941a12.15.2024.09.03.03.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 03:38:17 -0700 (PDT)
Date: Tue, 3 Sep 2024 16:08:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V10] virtio-transport: Add a section to define mandatory
 transport requirements
Message-ID: <20240903103815.pqjdjyedsqy3vr3y@vireshk-i7>
References: <4c24ede14e2545b2e9c69e7d9b79dc15744fd965.1723647318.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c24ede14e2545b2e9c69e7d9b79dc15744fd965.1723647318.git.viresh.kumar@linaro.org>

On 14-08-24, 20:27, Viresh Kumar wrote:
> The current Virtio documentation lacks a set of generic requirements
> applicable to all transports. Defining these generic requirements could
> be beneficial when integrating support for a new transport.
> 
> This section outlines the essential requirements that any transport
> method must adhere to.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V9->V10:
> - s/multiple// and s/employ/use/

Can we get this merged now please ?

-- 
viresh
