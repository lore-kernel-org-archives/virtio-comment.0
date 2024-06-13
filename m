Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB04912EBD6
	for <virtio-comment@lists.linux.dev>; Thu, 13 Jun 2024 05:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718258299; cv=none; b=AJXwXHwmyd/TVWJq3GWEOAlmp6Wp4EyflqSw1m3HEE9zx4KFeFyX3Ru6aMjZ/6Mh/s22dQwq2YX57DiiSMtzGOqdpLl56teuefQwRvbxyksfAQJo0wEkC9IVUzZ6U+Jr2Ic5goZ6bDVUmFz2x3NdptPFFuS9mBDbRIPqG44AUHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718258299; c=relaxed/simple;
	bh=DZDzicyalIIqEyp5qSHJUISgq8b4OB+tSJDeuNLRUjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iuThghe+a24ejurYcTjPXush10ocW7d5KTRNk1dKX6pAa1a640HWeyDLLIMkGUGEwxtUgNlsew/NWSOpr/ptC3NSgX/l6tvVcb+SArNN/AAXwt7xwLdEJHMagz4uvovNkWD4y1xpBqoYcLb5mZp+HFTI6ZKkkmNtRk7f33K3ojg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n7RObjck; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n7RObjck"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5295e488248so745789e87.2
        for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 22:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718258296; x=1718863096; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZDzicyalIIqEyp5qSHJUISgq8b4OB+tSJDeuNLRUjg=;
        b=n7RObjckAl68y6ysfWhh3PHQOEe5sPrH1XyuWX7I4eAjJLUXTf8BR7xaMetYTHRoHn
         hFt9soUUkxkJQQQPsHgJ/Wp+YRCvpS8U8I0AaYm0C1LUfycChly0l8d1ApOBTi4eymey
         ZznxjKepBwBxicMpXsMJ+0zw62j2JHqc0tJAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718258296; x=1718863096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZDzicyalIIqEyp5qSHJUISgq8b4OB+tSJDeuNLRUjg=;
        b=oREw/piFhVooK4Garf5enjRotASI1F2VcGod2FW6ODYjKxitXzZkLs/X6m9CGFEU7s
         2iNm7ql8gCGQh6nXuKHqp5ExgrGZpTtATHo4wax/MxBuGoLUkIRL3wi+xHUAsx4D2UJF
         4ot9jIhvmTctidR9N5nuU5fmksiga26GMJ1KTGTtkTbkUkE4Y3pHRwJnAGuMhJ8QBy88
         mu1rJerLIXGMhAioSATi4oiQH8SJNVMzQy0KL4l93Xu2ddW2W6ohnkDLmMVpWYBJg7XK
         y02fkZwZ5FX9HAl5uJdlRxYgu7Ri6Ibco0y9+Wn7liMelyKdkjm6lIFNKUaGC1MHLXg2
         j4Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXbElhOBxHex2BOOMsnipV1baBwPTjY/3xkhlBXdoPk7ObT0AF9f1+widRE1H3R1OjeHA+kSAe9NzEf3EsxOnYsq6On/4/tJE2aIKTn27s=
X-Gm-Message-State: AOJu0YyMPiAAYbBDnOKdjh4wWz14bXsxDm0LjzXLBYKJsP/1z4OQy8iz
	vRkW34vLlBFVdKmn1W1OQbVWCjHLySh6noH4qZo2JFxYGlu+GLStZCGaGYBZiGeNqeNqYRx/WYQ
	ffNDAaJE3n5nVOppPSrovpsk7iB4k6oMjpKn2
X-Google-Smtp-Source: AGHT+IGJ4qnL8YJXBe/wjeCivop7gtpoF7B3dTbeDPWjmdJ9RkUQoPlBzAu8hFavrPnGMWKq5+wP+3VHzKh/bTzC33M=
X-Received: by 2002:a19:5e56:0:b0:52c:8aad:5fc6 with SMTP id
 2adb3069b0e04-52c9a3c539dmr1915852e87.15.1718258295315; Wed, 12 Jun 2024
 22:58:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3319f7da-5c1f-48ff-916d-03791edf1783@amd.com> <PH0PR12MB548190E2CCAED2E01410F79ADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2657c74f-1caa-4e5e-b767-b16e059247ae@amd.com> <PH0PR12MB548198E64803B0A7D9389E9FDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2f9636c7-06ca-49ec-ac86-f8a2f1f97b4f@amd.com> <PH0PR12MB54813032E8F5B0DA32BA1B23DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e25f93cd-baa3-4a54-bf9c-1fc27fa95c41@amd.com> <PH0PR12MB54818F69437BBA6D533ABAF6DCC02@PH0PR12MB5481.namprd12.prod.outlook.com>
 <395ddde1-f8e9-4b6e-bf90-2f9c42406366@amd.com> <DM8PR12MB54804F81E1673C09213A4302DCC02@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20240612081135-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240612081135-mutt-send-email-mst@kernel.org>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 13 Jun 2024 14:58:04 +0900
Message-ID: <CAD=HUj5oeJa3Przmsd+MYDO0AAEhs-4sDvFQoiMhVTjnveNONw@mail.gmail.com>
Subject: Re: [PATCH v5] virtio: introduce SUSPEND bit in device status
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, Zhu Lingshan <lingshan.zhu@amd.com>, 
	Cornelia Huck <cohuck@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 9:20=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Wed, Jun 12, 2024 at 11:26:39AM +0000, Parav Pandit wrote:
> > No locks are needed. Hypervisor is accessing the admin vq on the PF.
>
> I'm not even going to try and get through a jumble of this thread
> heavily corrupted by outlook and whatnot, but from the glimpses I got
> this discussion looks like just two people talking past each other.
> Lingshan, Parav's not the only one bothered by how the device seemingly
> has to block a transaction until it completes suspend. Parav, I feel how
> to address this is up to the author to resolve really, leave it at that.

IIUC, Prava's concern here is that with the current proposal, the
device's state can't be determined unambiguously by reading the device
status field. If the SUSPEND bit is 0, it's ambiguous as to whether
the device is running normally or if it's in the process of
suspending, and there is a corresponding issue for suspended vs
resuming. The device and driver can know based on their internal
information what state the device is in. However, some hypothetical
admin tool in guest userspace wouldn't be able to tell simply by
reading the values in the PCI BAR.

Assuming that's actually a problem that we want to solve, then I think
the most straightforward way to address this would be to use another
bit in the status field as a SUSPEND_TRANSITION bit, with something
like:

"After the driver writes or clears the SUSPEND bit, the device MUST
present the SUSPEND_TRANSITION bit until it completes the requested
suspend or resume transition. If the device is unable to successfully
complete the transition, it MUST present DEVICE_NEEDS_RESET."

Doing that would give distinct values for each of the
running/suspending/suspended/resuming states. That said, although the
device status field doesn't have a defined width, both the PCI and
channel transports assume that it's a single byte, so we'd be using
the last remaining bits those transports have available.

-David
