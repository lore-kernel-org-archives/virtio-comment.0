Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24561B3F09
	for <virtio-comment@lists.linux.dev>; Thu, 15 Aug 2024 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723718764; cv=none; b=fHpsl3+18rFzb98oOBTFuxJTpDMieewnAMgrRijKwvZHuTlI2Ua2dPUvHtjK99XQtUyCmcsuoLyc74zF0BE0YUxJYbYVHDaogpHbfyBg8CpujdgotNN5lt43LuuYR7y22OkileoaE8aAm7eh7AkmX6ojR1lXLWUiIlzDvOFOANI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723718764; c=relaxed/simple;
	bh=qd4ovINwIV+y8GVuSJuAvrsmBSlTOfiQ5A9MHnZdfm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jIwTGfS/VVt6qkQTNnEueRP/fskkaHjObs+64/41bEMgwjBDXIrraaGVUxYAnj3o0z+zyq2QE+2nHRt1DpuUsJDsePMcqotAb+lqipG7SPIE2+IlguyCI9AH65amBTPLyLIh2W2WPy24phZx2QfrbX4Nci62u/TwFX/HQoviPiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IT7VTufx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IT7VTufx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723718761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ahsRah7peFcfaLXtLvewFiauBS+E32/4hqDcXCoI9hw=;
	b=IT7VTufx9BxeYd8hE9yH213+YLaGkeVoRwdHxoFbzQSvi+PGaR7CLkVwvjfj3tIp5y1WJ7
	vimGQ51arfaO3JuFMY5gawdLVDmrkVnGhxoSjsHKA7hUGdbPDcIjHdBD3UXc8EhC5Wti5n
	53Pp/Fryg1+iM6+a5eiKYpQaHPKxYzA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-TK4cYASGOuuiF4YNCxhlEQ-1; Thu, 15 Aug 2024 06:46:00 -0400
X-MC-Unique: TK4cYASGOuuiF4YNCxhlEQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a7a9761bf6dso78162766b.3
        for <virtio-comment@lists.linux.dev>; Thu, 15 Aug 2024 03:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723718759; x=1724323559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahsRah7peFcfaLXtLvewFiauBS+E32/4hqDcXCoI9hw=;
        b=thYyg/fV2Fnq6H17YPJJmZl+8KPWXqWIVzG3eHoYOdalYs1o4Ejsk36tCgxrC1Guh4
         fDkOGfSSQ7+B19cnZwVwKwQG0TLqPWDFNwg0FU8sRm89Egao7XuZBWpT8+OU7v0PCLHf
         DrykU6qVKAuU13Uh1pXkh72S8Lyb2jy/iqAoY6Ag0FT5Sq51eeCBfoGz3K5E3ZLwQoGj
         CGS2r9I8hyxilegbEXATculuQ45PWASikii1NBfR5Uq7aLPcGI9m88MZagjBqMaSevo1
         g7HbZto/CRqJkmU/ljCp1kdCYZ4uB67vHN+1LZbTieztTCJfCuAprbrSeT17Dc89Ww6t
         JLIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf6uskEx4lnOQZaOVi/v85sb8y4LXUQWxVKXA8P7jcg51o/sz2IxfzbKxrPxWJGShemZFAdC4s671hLH28w2GaKXEc5WZQOtoJXdA7mE4=
X-Gm-Message-State: AOJu0YzEFsnCwvHQhfZ2NzST+bbSGvE/JITCYO7ArMDci7hQj5ovv+K5
	zNPrz2xOP/3HVZNYmA9UEnoTaGf4nF2JPAGrTKa7q1YwL1Iieg4RoZyu9Ahjnyg3wj+PPKCqNtg
	AuaFfDgX9c28c+5QAV92ZCeCnnTuUg4q1PX5L7FDFFUnFAAWV9Dyag95dNadc6Dfj
X-Received: by 2002:a17:906:d246:b0:a77:cf09:9c70 with SMTP id a640c23a62f3a-a8367086cacmr406376766b.43.1723718759225;
        Thu, 15 Aug 2024 03:45:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3qo6IFAbuHvQ3VH89TC/D7LmSMS+aey8y6dksnpLujBZ7Eg00AZJtrH2ZJeenV1K8Fb32Hw==
X-Received: by 2002:a17:906:d246:b0:a77:cf09:9c70 with SMTP id a640c23a62f3a-a8367086cacmr406373966b.43.1723718758432;
        Thu, 15 Aug 2024 03:45:58 -0700 (PDT)
Received: from redhat.com ([2a02:14f:178:8f0f:2cfe:cb96:98c4:3fd0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838d015asm82748566b.90.2024.08.15.03.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 03:45:57 -0700 (PDT)
Date: Thu, 15 Aug 2024 06:45:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240815064513-mutt-send-email-mst@kernel.org>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
 <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 15, 2024 at 04:23:26PM +0800, Zhu Lingshan wrote:
> > So a device cannot respond back suspend=true in next 50nsec time.
> It's OK for the device to take longer time to respond, the driver simply re-reads device status.

You didn't bother saying in the spec that it must, though.

-- 
MST

