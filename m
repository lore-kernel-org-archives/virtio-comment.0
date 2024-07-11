Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CA629CEF
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 07:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720684129; cv=none; b=qV5AnrWPj9UCdt5t01aV9DSTeoUn6ptLd+Nkd/QbqxATBcgcIuo3O78R9Re7oZ01GJk1iWKUrtdtZhUPlHAia28w+oSI4gZuBiAqxO1JPytQXwP3kMGJHXyQrAZ5SdYo4XGlxn1U4+5sY/Xi50b4xVA+9Uj4dwPEpwF55f7mNHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720684129; c=relaxed/simple;
	bh=N6oinUOlZ6zx3T3FjWzQ0NVQ5XkJwF5mnfuAMtnJavw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMPa35JTdGtaYRJnAOuTnlHQzX8bBqUV9SdBqA9uiwyJdr5hHm6h+c600ucDlCmtqTF9H6Bk753As8LJdBklheuZ+eZpViUE87Ll2tRL3qWW+c4oTSeV3aOEXQZEv+BkR/X7K1/P+qyoNIgWRI/gtR3JONN+EPNSzvrxPQmsBm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cj95Eahm; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cj95Eahm"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-70b2421471aso374712a12.0
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 00:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720684127; x=1721288927; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M0WucfIRW4qORntXIRHjeW8gA0MLIXRUZ+th0QBphus=;
        b=Cj95Eahm9GUAwyZSt88u6BdVKKgVYqNWp9ScJY5J6BUbPwzR8CLgl01w4luVniV8oP
         3IXi/5g2eirW+QPHW21qZsSYkdZyYaYHvbOqj5aaZZvt16uwtbPvfALk6MtmGhjIz920
         JMalU6zysbKkwl4AT0Jt8oYRWcl2dFjwCUG4pmdxi1hMQFRiz9Z3YoPrd4bCAPpKs14c
         aoeE7vBlqrp16ljLg76jGfEtoE904pb2tCoiYf1OvGlndRzVW4OEuyZqCBS8a1redvC+
         Ag9gmD5huDO9D8PL+LY2RJLhBXQ81mIPoAR7IKXJs+FdysnvWRFsv7/fNtAWrGLca239
         QTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720684127; x=1721288927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0WucfIRW4qORntXIRHjeW8gA0MLIXRUZ+th0QBphus=;
        b=pS5PJQIL8AObt3VqLvviKXkRUJuMvv8sXL+18efq1wJGhdXPOM57cQwsnRxxeN+ld5
         Wnr0PKEDweZIQ0Eqm+wCP4zBtkRamJ8GQ5hm6uA27zud333juCq+K5pRS2GQsEbLRwob
         jKpzR+wiuYAzc4cSBn1B26I7sQU09kd1vHfBkKkKS8z+E3Vuo8/PM2p8V+qSNIoCrTjU
         hiKz/5eNUF1CNFAM9UvaDKmbYhPugAIEiXuf+vWez9R3c3DnQ767b+nls20vSkWpGPCo
         fbOMps1qYTeF3r3CjaQOc1LpKxle6655AH4mTzUbG+PosgNv5Gz9kdCsFuTLfzu0TKxH
         mbIA==
X-Forwarded-Encrypted: i=1; AJvYcCXZV9dWLvdiflzXYnbFR6GLrusWtk0WqGMABjUHDgOkZss7KIlppIH/UudrU6d31itpOEHNhi4+sjwfA+p9xFPpnReizinXaG/wiJPQbZ4=
X-Gm-Message-State: AOJu0Yz18cBFBITvTIAI71GjjmFYPQEYBV5cnjrsqPrR3P0ahG0GbL50
	M5Wah8KGcaitYR7bYROlCfbV1uQzdpyh1ITQzrz03DL8JZaFKOCU5qYg6QmfOuY=
X-Google-Smtp-Source: AGHT+IE1VsaVcT4ES+YgwM19gVJgj7NsQNCv1z/oohEJ2ufJyKfiXijPiib2W1aevLAEQ9FJ5wl4rw==
X-Received: by 2002:a05:6a21:168b:b0:1c2:8d30:accf with SMTP id adf61e73a8af0-1c29822daa0mr8666481637.19.1720684127583;
        Thu, 11 Jul 2024 00:48:47 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ab6e4bsm44599235ad.144.2024.07.11.00.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 00:48:47 -0700 (PDT)
Date: Thu, 11 Jul 2024 13:18:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH V6] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <20240711074845.ojo3zq4uk36vhdci@vireshk-i7>
References: <51a926b4ea2240753bcda6041a9076d58e980082.1719299462.git.viresh.kumar@linaro.org>
 <ZnrZh5lfnFNMn5bM@fedora>
 <20240626024130.z2g2ypjyn23sgwmf@vireshk-i7>
 <20240711072128.ptal2sigsg5cu3dv@vireshk-i7>
 <20240711033414-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711033414-mutt-send-email-mst@kernel.org>

On 11-07-24, 03:34, Michael S. Tsirkin wrote:
> Are you going to address Matias's comments?

Done and sent V7 now. Thanks.

-- 
viresh
