Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ED1CA40
	for <virtio-comment@lists.linux.dev>; Thu, 30 May 2024 06:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717051007; cv=none; b=S/NWBU0VM1Jxzi6wjOLuyre5BHH5it5oL2XlK9ZYNB7Ev+O7/oJdHRhg5yQVc0XAaMtAOBEanr18n5f5mJLv8rROlA/xRDEV7P0kwMSHH24upu3GTTxwRC9Csh/b6YWOJ/gWyJFG5GH67GX7HHUPqvCIbk5PDeYAekeqM+tThPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717051007; c=relaxed/simple;
	bh=AOxRND/pr0e4Pcd/CqKo9DMyzdFPRTgqHsAfwzJVsN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwnG6YK7TnADVxnFiD/3dE/agbWX6rve8Ta17iHte19emT2vA7Q7cuF6c0upilLBXDLy9LjpoSbB/HdsDdodd6RnQUSLkIGEdn8eJ29CgV0/SyzkysfDAMZWJj9i+gmTforV/4U5WgLQD8jU/BCesLJ2+xsX2cueNK7d4cZaTsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BfOSS5gV; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BfOSS5gV"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f61f775738so1547315ad.2
        for <virtio-comment@lists.linux.dev>; Wed, 29 May 2024 23:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717051005; x=1717655805; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=33vx0uHr8EpdACcjgWNzR9jD7K0Ix7N5lJ8cQhy0ukA=;
        b=BfOSS5gVUWhbdV4qnENKr2wdlFKu9OHT3mj5+9Ynz9A/qPut2NSa7uPnevPNHkv1AA
         nT38WsJItwGIbif5ZPZAs7myuXpEdEP9pwaSmEA9klWaf2ffTArL/aRmKn5GVufGCBuG
         rUyRBrEpvExlIwOzpk6U64/ra1L0C5jhAQ5X+jWszZ3ZskPinICAkDm5HVzVLhUn5PtT
         nJhojPfFkEfUOyG/rNauL+8y5MBULmVlJilO/Fi0pjEsr8u8sTMcsK4gwj4DF0KQb9fz
         +CKNaNlFQIB03ndFuC/wGOeDP7fzHf7kWUx+VLkPfWunBZ2lDfH+EJ1tF3H2GHtf7Cjg
         iyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717051005; x=1717655805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33vx0uHr8EpdACcjgWNzR9jD7K0Ix7N5lJ8cQhy0ukA=;
        b=PYR2+WXPKRI13uR5VpXlMs2un9r3FydnH2nnEA4xLgSJQRujPQjigkELMiWGjMPkC/
         aDndjQw6U720hTbMGM6DuXSOp3gnLUE1c1CJF32mSLkVHTGVF97lMY8qIXDcoaSisIvh
         EX4hgUp2HB7qKglxyuVrHPFqwvwsidtyv0dZwg5MHVW1OxcnjtiEEF0R05RpRnUe3DAp
         JqvVRrFOohHXa4Iq6knjS0nj6/bD22esTSxCPvugHwYmVGaDJ2hiEOLYkRatD6p5vhqO
         qkYwoYlar62QDJ1gpghPIawmTnVCbzv2rMkLcT1Bg4esUTvT8v3+6mhSKygt0KOQ9Hm/
         6jPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoBKz/POEVFYnEuaS722CKnX17r5TGPfC2NcQxSzCxO5mZsgip8uls+lCA/isuXEwHiP/LRKZ4s5+1ih3zn9jpCt+vhSzUNAcrrnETZ4M=
X-Gm-Message-State: AOJu0YwaO4sAyCzMUjYuPqIdAkWhZYqAvNEpAKDUUCPxKW06nxBS4nJG
	ezRU7zoZDvXJRKtYsDKROqcn/mfUHK89igPBjNzW5Deb0GM22/Ou5aLUXZ9JQ2c=
X-Google-Smtp-Source: AGHT+IG2w8vyG+KZW+4Kzq3FIrpaqKHd+58wyOktM/hbj1veJARHzmW5dF0DosOrbP6K+tvjNLvAyQ==
X-Received: by 2002:a17:902:d2c4:b0:1f6:226f:cc57 with SMTP id d9443c01a7336-1f6226fd2cfmr3498275ad.18.1717051004673;
        Wed, 29 May 2024 23:36:44 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f4b412a5fesm60178715ad.239.2024.05.29.23.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 23:36:43 -0700 (PDT)
Date: Thu, 30 May 2024 12:06:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH V3 Resend] virtio-transport: Clarify requirements
Message-ID: <20240530063641.mzdkd3gsh2cmemop@vireshk-i7>
References: <3543c631e29d35a667ca9d9e912d1a6db1feb0ce.1716197180.git.viresh.kumar@linaro.org>
 <20240520092332-mutt-send-email-mst@kernel.org>
 <20240521105706.tbyigihommrasdua@vireshk-i7>
 <20240521073925-mutt-send-email-mst@kernel.org>
 <20240529102424.s7rnq7zqqjy6bfdw@vireshk-i7>
 <ZlcNqO1ZxmGuUhVO@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlcNqO1ZxmGuUhVO@fedora>

On 29-05-24, 13:12, Matias Ezequiel Vara Larsen wrote:
> > +The driver doesn't access buffers, after it has added them to the
> > +virtqueue and notified the device about their availability. The driver
> > +MAY access them after the device has processed them and notified the
> > +driver of their availability, in a transport defined way.
> > +
> 
> I think last sentence could be rewritten as:
> - The driver accesses queued buffers after the device has processed them
>   and notified the driver of their availability. This mechanism is
>   transport defined.
> 
> 
> > +The driver may ask the device to reset the virtqueues if, for example,
> > +the driver times out waiting for a notification from the device for a
> > +previously queued request.
> >  
> 
> I would rewrite last sentence as:
> - The driver asks the device to reset the virtqueues if, for example,
>   the driver times out waiting for a notification from the device for a
>   previously queued request.
> 
> 
> With that, LGTM!

Done. Thanks.

-- 
viresh
