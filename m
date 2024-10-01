Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BD51C6F7B
	for <virtio-comment@lists.linux.dev>; Tue,  1 Oct 2024 14:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727793428; cv=none; b=VbISh9QM5mf9lHZt9I4LjWs9M1SveEgS5QvBPUGEfvH5BNFaUAB87t/SjuFTz+xC0Hq2whVAknh6sB8ATg6ER4vne7Fe2yQDGZdBRkeLv/NqSr2aiuzuWS7S2Z5XWwwQhgsCUMOgcheqWijMAtv9BrL0fSV7G2moRwPfCH+jbMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727793428; c=relaxed/simple;
	bh=QqoupNDBua/7vcC63JP2wlx7kqt3YImz4kfmq9beE2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQjsRccVU5Vn7VbOAfe2kl8x2CvUX+h4fbR5MbujRv0AdY/xtPvfv9qx/LaNPSb6kbdBmesK6J3ru0/vgAcgo1F452rHQpSPJvukT3ki05iyochgAAkUT1kEBnvjlXiCkm/uDdbqRD1YaHT9eQf2Qb+poTKn1R6UAwLsTTojjk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bkm4BBYD; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bkm4BBYD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e0b0142bbfso3575049a91.1
        for <virtio-comment@lists.linux.dev>; Tue, 01 Oct 2024 07:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727793426; x=1728398226; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MoQkkNwO+aslbvEhH32x2jo7FKE+x5kGHQfHYzNNXik=;
        b=bkm4BBYD5Wf+n/iNuouIYZ29MTzm8d7hkni2D9DS+dl+BP68F4vKM5OJTe1d6e5vKQ
         0iap+kWSpIymNPe0DjO/LiHtfWwp84/P8J9DbJ5piXKPiJX3VZfPTPqROO/v0Uh4OJ7l
         3W5RZzHZRhEhguTeIvpZH/dowkFERARsEaJAP2aBsHadOxdcYY/RzKrtpqMssJSKajEG
         XydLsPyexLhMELsiN5hhJUQwu8uR6K2Y8mK3g/5vKXZih8UE2mTlffONdaX01AKJybgg
         h8S7yeNB1+ydbNAwriD6xo6cX+0hIZP+r5tPhzVvEGvSfSIj3OER3AKyG+hRyKBhN2A2
         sb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727793426; x=1728398226;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MoQkkNwO+aslbvEhH32x2jo7FKE+x5kGHQfHYzNNXik=;
        b=WYhT3BmrmBsPju6X4p0XNpUhykLiQX1PDfcV3sWEifc0e2jqMG/UV77vZr+5Z1P7Rm
         PTVZ39ivjAxoHAE96WNiY+TXdaG3FNCeazLO2ujfe7xZfSyi+w+224V/sBGqqiq1qlcF
         0Q+CI4R7VOiN/N7ZuryUKgx2V9r/wgp6z4jnz9YxxYsL5qRL8HjJoWl+3kSaUcD7CxyI
         0gWkdqwaIgRjj0rJSIB9cRbjFoO32bfVpG6SSfK1aMOA9BMfDaIRSbwz1nzvIcAgDSNe
         efCdE52o+stnDPGLZKKxox9n14psaM39mR/5QF2NtO7dGq0oRCaB0c/IBAIjI0RO+0wr
         nX4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkz2vtzPBjkWwcL7cUd+VEmnwn+tc/JKhZN9FeGe0olXgTgMT/Z0WMlwbYpF2MAfxLuigaOwdmap7R8zAPxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyE4ki8T0ERX+w8bFhZK/bcVBDwrh7WBYRzAOlSreJu6rmrzb1B
	qQcaUJCy8bQFP3SEJ9q+3+Liu+pnwrBD/JJmpiC8aN1YkCskga5S/AW2eUmnCw==
X-Google-Smtp-Source: AGHT+IFPYir1D0D+xQfrxz0cGnnbgI90RRBUkamKNCuDyvM/BF/MtSxEfDuZ+G+PJQdK3F/MLanlqA==
X-Received: by 2002:a17:90a:9605:b0:2d8:a744:a81c with SMTP id 98e67ed59e1d1-2e15a1a1a04mr5347958a91.1.1727793425833;
        Tue, 01 Oct 2024 07:37:05 -0700 (PDT)
Received: from thinkpad ([36.255.17.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db5eb3a4sm8276034a12.63.2024.10.01.07.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:37:05 -0700 (PDT)
Date: Tue, 1 Oct 2024 20:07:01 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mie@igel.co.jp" <mie@igel.co.jp>
Subject: Re: [PATCH v2] transport-pci: Add MSI support
Message-ID: <20241001143701.chbjbz4aoip4lsoy@thinkpad>
References: <20240712140144.12066-1-manivannan.sadhasivam@linaro.org>
 <20240724162143.GH3349@thinkpad>
 <20240903053218.7lapwvllgz4xk4se@thinkpad>
 <IA0PR12MB8713D97523757F1FDD6D3525DC762@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240930022818-mutt-send-email-mst@kernel.org>
 <8f7a2626-f066-4a49-af09-9b83e95ca0a6@amd.com>
 <IA0PR12MB87138EEE12B3A853C10605AADC762@IA0PR12MB8713.namprd12.prod.outlook.com>
 <030cf387-48ca-40b8-8dab-70f6beb4011a@amd.com>
 <IA0PR12MB87130121332B747C19FCDB06DC762@IA0PR12MB8713.namprd12.prod.outlook.com>
 <7fadd459-05c2-4adf-be02-25ccf6990251@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7fadd459-05c2-4adf-be02-25ccf6990251@amd.com>

On Mon, Sep 30, 2024 at 03:25:31PM +0800, Zhu Lingshan wrote:
> On 9/30/2024 3:15 PM, Parav Pandit wrote:
> >> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >> Sent: Monday, September 30, 2024 12:41 PM
> >>

[...]

> >>>>>>>>> +Driver MUST support device with any MSI vector from 0 to 0x1F.
> >>>>>>>>> +Driver MAY fall back on using INT\#x interrupts for a device
> >>>>>>>>> +which only supports one MSI vector (MSI Multiple Message
> >>>>>>>>> +Capable =
> >>>> 0).
> >>>>>>>>> +
> >>>>>> A single MSI (and MSI-X) vector is still far more optimal than INTx
> >>>>>> due to
> >>>> the inefficiency of the INTx delivery on PCIe transport.
> >>>>> And lack of support on VFs.
> >>>>>
> >>>>>> And for sw based devices, it anyway doesnt matter a lot either.
> >>>>>>
> >>>>>> So when a new functionality like MSI is added, it does not need to
> >>>>>> continue
> >>>> what MSI-X has done.
> >>>>>> So I request you to remove this guidance of INTx fallback on single
> >>>>>> MSI
> >>>> vector.
> >>>>> Let's provide an alternative guidance then.
> >>>>> Device SHOULD implement at least 2 MSI vectors?
> >>>> I think one MSI vector is enough for functionalities, just shared by
> >>>> all interrupts.
> >>>>
> >>> Functionally MSI vector can work sub-optimally, because now on every VQ
> >> notification, the driver will inspect configuration space to discover changes,
> >> generating more unwanted PCI traffic.
> >> when the device notifies the driver, the driver needs to read the vq avail / used
> >> index.
> >> But the driver doesn't need to examine all config space when receive
> >> vq_notifications, the config space changes are reported through config
> >> interrupt.
> > Right, but when there is only one vector recommendation, the driver cannot distinguish between vq notification vs config notification.
> > And it will result in inspecting config space changes
> That is true. And the driver can check config_generation to determine whether there is a config change.
> Only one MSI vector would sure lead to performance overhead. But it is still the minimal requirements.
> 
> Additionally, the spec may want to say: Ideally each vq and the config space should have their own MSIX vector,
> and should provide at least one MSI vector in its MSI capability.
> >
> > Driver can implement moderation to not read at < 1msec interval.
> >
> > So there are few options for driver and device each has trade off.
> >
> >>> So, 2 seems a more practical tradeoff across functionality / performance /
> >> scale.
> >>> And single MSI vector instead of INTx is of course a good recommendation
> >> by itself to include as independent line.
> >> It should be a minimal requirement, not for optimization
> 

Thanks everyone for the comments! I guess the conclusion here is to drop the
INTx fallback (which makes sense to me). And for the minimal requirement of 2,
it is already mentioned in the 'Device requirements' section. But if the
fallback needs to be dropped, then that requirement has to be changed to '1' I
suppose.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
