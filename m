Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6AD171070
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 08:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718095268; cv=none; b=Qj6ptZGIKFJBxUzR+rE2P3gkm4tsmnlRObVnF1io3gchUeeiRQbyNKky6vMyr1P1LTSJW2cLRzEwfiVRnbU3Wug/q8q7TVI+1zy498dhTPRfJVThNi9t+Kcjs8PT/eeoChjmOjgrXEOCG+XSxQyhSNnlSmq5qBKWV2m1lGiqxV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718095268; c=relaxed/simple;
	bh=NIUELCs4QFZkR5D0P2lLlwp/aMqf9fT7xNp3lU2YBag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vD2gl0TkBIseDi6fBhjKv8HUcWm1r7RMtJu6TJlQBLtq8ZPjNBlYhO6LiQNrqt2dXsbovdt3zpiBoVTgKe6I5naYf4DmCwo3TZswblU9ZUXy+6IVlne7x67GoyQBITDQYgJOC6WKeE/4AFWTxSwb8yJHWjOzkRrdWcsVh/4q0LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DTWLlcwM; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DTWLlcwM"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7024d571d8eso693903b3a.0
        for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 01:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718095266; x=1718700066; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z036+ynYvVCbHNUXClkhYBgGmJvPscQbLLKjloLzvjg=;
        b=DTWLlcwMfwJAJclXXTOuHpp7K/qAt1JH06D6goxxgf5W3Iwu99ARFDEv+jiZ/6Y2lx
         VLqgWKrGraUDVXl23Jh9aCoXhnszquZJo9oHazpRrlqjtUSs6CpMzuSLrZNwfoPx7uNX
         YnHW4nRmGAUOr0zp+tjpq1nxKaPCAEoGjuOXHZdst6zHsu7+4e3c+rkIZnlJ2jFT6Mn1
         obOzXiZlXVPrHsSst3PZhjX/nt+sarwdezSPuOpYp9kq61rxe/e4QonvVlXDbdTTyfrp
         2Prt1Paa1oR929f97wUGgpfzBN0KM+4Cdrrz0LZxXJAhLkL2nhFKFMDQAC89+qIvUiu/
         InnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718095266; x=1718700066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z036+ynYvVCbHNUXClkhYBgGmJvPscQbLLKjloLzvjg=;
        b=G/uWWqWWf+oqx4RTzc32wb15SzUaFGYq/wAyNCW8MidzktUJ5ysuyKsioa2597/ULN
         9Gye7VGlJJI2yHvVS2vv5uyb2Qi8WemkptnLYBY/efy8+MbwqPKfQwQ4Ui5H2RNcp7+8
         Qa5YUmRhXixcyvhBt4vorsJwK8xKkg8q7YU/50n8Kg51pCjdk42H9zFMiyvklaUEiEZo
         s4sSrUnn96B2sO/obFuSKe2p6/t3TNFETzlyTI1QGkxOXNGc/JdOcgKvBFJO95M/WwJp
         Vza9QDvEoW/ulSXHN/xnvtk/8Qp35GYYjUlcMpRNvZSZlLidhQc/4BryCQtBNr6OE8QM
         HL+g==
X-Gm-Message-State: AOJu0YwnTChEuOz2U7tytBugHVzTKgdjLdmyljCiLURk49EARTMoSfD1
	DLqtcMps82VDiQSZnkkHUawrMguTD+TJtYxGuH7TTmD6Ur1GlgZSP8LSEBOIhn0=
X-Google-Smtp-Source: AGHT+IGvSRw9TYZoKz10Vm42QbuXp1ScpzCVbUNtCrigjB5QE6Lv/0Ga3vJyY/vwdWvFrMoUiJhRog==
X-Received: by 2002:a05:6a20:258b:b0:1b6:7a70:d46a with SMTP id adf61e73a8af0-1b67a70df48mr8391162637.18.1718095266348;
        Tue, 11 Jun 2024 01:41:06 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f5585019sm54611215ad.26.2024.06.11.01.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 01:41:05 -0700 (PDT)
Date: Tue, 11 Jun 2024 14:11:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V5] virtio-transport: Clarify requirements
Message-ID: <20240611084103.3u7bsoe6nlr6xngf@vireshk-i7>
References: <9d543789de03d26a27a43ae8f7621d07d66e8731.1718084050.git.viresh.kumar@linaro.org>
 <PH0PR12MB5481413D59F2DC236F0B59DFDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240611065816.lq3ehs7fmpjbihip@vireshk-i7>
 <PH0PR12MB54815595D5B533A6E38636F2DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR12MB54815595D5B533A6E38636F2DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>

On 11-06-24, 07:41, Parav Pandit wrote:
> Got it.
> I agree to Michael's suggestion "I feel a non-normative section is enough for this."
> So following his guidance, we should remove it from the requirements and have this as,
> 
> "implementation guide" or appendix section and it also looks good without the key wards too.
> 
> Otherwise, this requirement section becomes the example of how not to write normative in a normative section.
> (and we want to avoid future such examples).

I am okay with whatever Cornelia and Michael finalize on this.
 
> > I wonder if it will cause some confusion, i.e. about the state of the virtqueues
> > on device reset. I understand what you are saying, but is it a given that
> > virtqueues will be reset once device is ?
> > 
> Yes, it is given.
> See the spec snippet:
> " A device MUST NOT send notifications or interact with the queues after indicating completion of the reset
> by reinitializing device status to 0, until the driver re-initializes the device."

I read this a bit differently TBH. It only says that the device
shouldn't interact with vqs between reset and reinitialize states. It
doesn't really talk about virtqueues getting reset with the device.

> > I looked at: "Basic Facilities of a Virtio Device" -> "Device Reset", and it doesn't
> > talk about vitqueue being reset with the device.
> > 
> It is covered.

I am okay to remove it, since you are sure about it :)

> > Also there is a separate section about, "Virtqueue Reset" and it talks about the
> > possibility of a virtqueue getting reset alone.
> > 
> > Maybe something like ?
> > 
> > The driver asks the device to reset itself (and its virtqueues) if, for example, the
> > driver times out waiting for a notification from the device for a previously
> > queued request.
> 
> A requirement should be, 
> a transport should provide a mechanism to reset an individual virtqueue.
> (it is not must).

Right, I can add another requirement for separate resetting of
virtqueues.

-- 
viresh
