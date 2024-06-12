Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E787374D3
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 12:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718193891; cv=none; b=pHrNBEPtX2G1Q+gurahT56ZcG0Ivwvxa3kFK0/C9d0Jsf9pZrJ9BxYK8Wnauei1DIP54lylz/NWCnlQfRoAj29Vvuio1mq5F0Loi40ON+WiaFypbrunHySif5tU9O3MxdZm0HT2HeXLOm4Sk7q2EZoYS5AMt1go7ioQFoO5XSKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718193891; c=relaxed/simple;
	bh=uo6h8C3gRAadI79D1oQY4Wxp/BEcoSfxzJgsjrjFBZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ijcAUAeRI1RacfJrWD3RerkKNPrslS3hPQoJmUVJZkinK6A3AJ+HfkD2D15EkzESs7GxRb48mWcmQKm6BLWHEfvDowk2mu9dRD9n+H9Ajg1JlHa/n4m30C3hEYYgtw3gG3QQ/fVeYH/JpmF4rVwcyP3FyC5Xi7fBdoofe+2btWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ipYGAYL1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ipYGAYL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718193889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W4/Hp1+tJDHnAzXQ/p9HKQaaFDlzd3WqIIYeWsC/zRA=;
	b=ipYGAYL1A3/T5N1yw5bsjy4vOyuUJBqMer/kLrOz1mDfUo65jqXdmyoXYwvnJt9ueaAJQd
	h7z988Rf0VsiMzvxyOmGeGo3hd7WeIyOByf31s/bnOc2Od078mH8IITs/MGgAvxaAEe6bi
	f/8GA6CscNSLKnAr8B37Ouj1DlkH7GY=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-OQETPQDOOZOkVeZO7495MA-1; Wed, 12 Jun 2024 08:04:47 -0400
X-MC-Unique: OQETPQDOOZOkVeZO7495MA-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2eb6f6b1b2dso34433861fa.0
        for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 05:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718193886; x=1718798686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4/Hp1+tJDHnAzXQ/p9HKQaaFDlzd3WqIIYeWsC/zRA=;
        b=hJAX+FY0gQ4e9PAjjsbCA31Vx1lGSry7gkyKmnIL/WGwNYFv/yeNPS2hyCVaVcLQm5
         M5OROIpr8H/19HW4oR6Ec5hwXkUXDJ6hnOEsOhz5wpt68Ws/bHaLb0YkxTagoCURxxF6
         3EZ5Hf/jEbTzjM+YJC88ZkKjqEFW2TxTvaZBjCTdbSeaAYuy9DRTNAXDTtSwhVwV7suy
         Bg8d7U5MCpIkNe7rAsTQS8uLx+lKRiIMlQ21c2QfzEyzMuijRAKrbNOESe7CVC4uz1KR
         s8qxpbbbo/Q6k4heT7fe9o2DPeAhQaId0T8rG61t/hCtS176HUeALLoVvDyhleMVpa8U
         bWvA==
X-Gm-Message-State: AOJu0Yyr0vMDaGEJw70Abflxy43T8HYuXEVqqF5b+3BVmcU9LavbV45u
	TpQnmpV+aU2c3mp9smI9RgGirREdQpfY81Zg71PBVemU63VmQ13BtbhEWu0x2PfyZXYMHbp3QUW
	ruPcepz/Kd/ETnvS67+YO3FGRuKpJF6iTKOaSqlVb332dkMcMZFou0dsocraHqVSq
X-Received: by 2002:a2e:9bc2:0:b0:2eb:f86c:9d69 with SMTP id 38308e7fff4ca-2ebfc9f6989mr11255571fa.29.1718193886058;
        Wed, 12 Jun 2024 05:04:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGrN5Tny9ZW1jSFMDNGi4tlIpZ6PP3AlHlm8mepWNcR9bBBVV0wuo9PcprNb057rmm/sJ8cA==
X-Received: by 2002:a2e:9bc2:0:b0:2eb:f86c:9d69 with SMTP id 38308e7fff4ca-2ebfc9f6989mr11255361fa.29.1718193885416;
        Wed, 12 Jun 2024 05:04:45 -0700 (PDT)
Received: from redhat.com ([2.52.131.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f20f33f5fsm9138018f8f.47.2024.06.12.05.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 05:04:44 -0700 (PDT)
Date: Wed, 12 Jun 2024 08:04:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Cornelia Huck <cohuck@redhat.com>
Subject: Re: [Request to merge: editorial] Fix admin to administration
Message-ID: <20240612080408-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54810E16E35AEB44AD31C341DCF32@PH0PR12MB5481.namprd12.prod.outlook.com>
 <DM8PR12MB5480B63360C1C057C8FEB539DCC02@DM8PR12MB5480.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <DM8PR12MB5480B63360C1C057C8FEB539DCC02@DM8PR12MB5480.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2024 at 11:39:43AM +0000, Parav Pandit wrote:
> Hi Michael,
> 
> > From: Parav Pandit
> > Sent: Thursday, May 30, 2024 5:25 PM
> > 
> > Hi,
> > 
> > Can you please merge editor change of [1]?
> > 
> > [1] https://lore.kernel.org/virtio-
> > comment/rkvznbkvylpld4basur3qxjsmsncawpt2hpwohrrg77yxwp4zc@i3l6t3
> > htp4oj/T/#t
> > 
> > It is posted on 21st May 2024.
> > 
> > It is:
> > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> 
> Can you please review/merge this change?

Yes. I am trying to determine whether it should go on 1.3 branch.
Cornelia, what are your thoughts?

-- 
MST

