Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC104CDE0
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 06:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716273865; cv=none; b=SFnJwpKKSL/9Uo48PPj7XuSEljbZM/aj7T+ekHdyQ/mgrd/6OTQQubCcIpWYPG+X/qfvV00Dy7IBRETiICeachnXbGDAFn446KAAaGxLFlqSSq6XGg3qGjcKRKEzZ+1h+R3TjBPS5zk3LwUdgJ2MhixoSajrOxSLWOjUVpVflFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716273865; c=relaxed/simple;
	bh=ItsQc36XRpl0PlIK2GYXtbbS4kcWyzx+uQSrvybA7uI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZU2s80lLJbNB7wCS0Wuu3oBnmlULYFD0KdVo2DyVObJ+L20bpiZsDpWF/CD31aqoCTuZ5w6t8kHIjhZOt7qkwKKJvGpkpk0JfO+xshKFC50atMyiGvB1pB3j1OmGxCwdB1Sl5JChdAwRQa9yL5pyWHz2spvrPL5LI2viWU7hROE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l7vCtU6t; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l7vCtU6t"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1eeabda8590so92902105ad.0
        for <virtio-comment@lists.linux.dev>; Mon, 20 May 2024 23:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716273863; x=1716878663; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zZJHVvCDSGmfhT+sZ8gumFaCEHqxakUpTmREJbvnKqM=;
        b=l7vCtU6tbkCGi4Mf7BUsMjgCmuCg5pePOoPLjTAuYgCaOWqzypK7x07c/R97YUx+kJ
         wuQ/aAVXreKqIj/BTORNxXBQx/cS+cW+yB22GP1KeqgeUgWx4qSS2y1RkcLm9eyhvCmr
         Y9LU4iFRHavpn/eoE15vsgWZF+ZqF6+kQb/mGwNGhl65/+5hMgFg0H3Zv7RtCoNFrXSS
         FDycNSBF3ZVMZxQBE44QpZ7JC/qNBdYMcIrpTRfpw0GB4EWH1lIfDor/Z8ag1wOUla3V
         q9luverDTwl0HYUC2yp3jop1hgAvYqHeJFBXQVFCT4ydIjHz3Sx946kmdh0S1qzEOou1
         MLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716273863; x=1716878663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZJHVvCDSGmfhT+sZ8gumFaCEHqxakUpTmREJbvnKqM=;
        b=BZ+gFAT0ys1RtICSDet17XczyZ2z/bUfaPOroVDZNKJqGMT9pAT5xwjde4yM4t7vDL
         uwQbM9qPcB/X1Nx79SGUdQOyyyDg8qQKt+S2hb5lNJW96whNvVsPZqrFKjremPmm1pgg
         wrgr/XYMroUwTLxMC0Dle9y4nIolj894yt25ZeVWB8Eg1Y8/0KJTbMZotUdWE3TjLEPc
         meDbf8hyTJKEaUG9B1IK8WBEaYZWvf/XgnJv/v/5gXWywh4DkQSGV+VJDDhXWilKPATn
         3D/VVOb845VkqsKS6BKTIh4udnvDj9uQ9DlO+ku5t+8gNCDGEOaLy7GEFN2sQHmzfOjF
         x+xA==
X-Forwarded-Encrypted: i=1; AJvYcCUgYoq1qt2XptbnX2etNlBnDLfIEhOGObC6216z62rxXJMqpNg63vVqXBQ8O1y5qjIgNM4v8vq5viuQ7H1PmIUwOfLUkpFHrwVEhUfWSrQ=
X-Gm-Message-State: AOJu0Yyn1rTYJq62f+LoEIakxN7uQ8lD+vnoWKLlAokRtnRm5G+aJ59b
	h9PMoAz5i6qEIWBWks/Cjs9lxKxzH0kOO8gec3o0io2seICrI8a+RWhttY7HIeg=
X-Google-Smtp-Source: AGHT+IFTZTsBVMijqj7bO9HzwK1/QSYtZpEodjF0qHprZiH1/aUgxMe046EbGrCKbsn0zUcuJrFYAg==
X-Received: by 2002:a17:902:9a0a:b0:1e2:9aa7:fd21 with SMTP id d9443c01a7336-1ef4416150cmr269824585ad.54.1716273862942;
        Mon, 20 May 2024 23:44:22 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f2f387318bsm47786715ad.189.2024.05.20.23.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 23:44:22 -0700 (PDT)
Date: Tue, 21 May 2024 12:14:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"virtio-dev@lists.linux.dev" <virtio-dev@lists.linux.dev>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH V3 Resend] virtio-transport: Clarify requirements
Message-ID: <20240521064420.35t7vaavzduwm7q4@vireshk-i7>
References: <3543c631e29d35a667ca9d9e912d1a6db1feb0ce.1716197180.git.viresh.kumar@linaro.org>
 <PH0PR12MB54815E4558E7577AC219F5F9DCE92@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240520082400-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520082400-mutt-send-email-mst@kernel.org>

On 20-05-24, 08:25, Michael S. Tsirkin wrote:
> Well we say "do not do this" in the list subscription form.
> Viresh, what gives?

Apologies. I didn't read the page properly.

-- 
viresh
