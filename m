Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCBA5A117
	for <virtio-comment@lists.linux.dev>; Wed, 11 Sep 2024 05:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726031070; cv=none; b=R7fhO6zcOdW6vEA5PEz4vIfq+umt9Lp/cn5wJ0Aw6fQrbP57pyjfHsMRqXr1JRf6hQl4sHh/cHAN8YgtL1QB9UqIiaH8LRUEUbJ5zBDcHguKlsCmRQi0rVJ1m5erLvdT2kVl9+TZ9onV/uF/w0ubrdNdNJVa30nCC6z0jQjmF/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726031070; c=relaxed/simple;
	bh=zKmX/YnOcn//8OMHoN0+RlZKAl2aw6VUqhMIXjX2Wzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sBbDAyH7lFYvkO5q7WCWKBiQa57+egVbqqdV1DmPX/lABb2kHpm0Jd5EkNUt7OVjAC6V3QdrynpddHBFxNB/iU/hXpcYNi1dqZYGMMXN0vIHyytuIs5ulqqgye0kkH4ueV1PMt/miwMVR25ZkijP3RUpJbwmF8ufZhiqrBaASsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U7/driJo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U7/driJo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726031066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ubjMo8NwKL7SnNTWgd+Dm+pnLJ9UIJp5NBZ6jtgWJMo=;
	b=U7/driJojgMKDyA34pIp8itA75KQy5dZyhB23ldb6+Z0SERW1zWHIphUWUAWh1NQ2QIRSC
	0KDr5ynhLLZ/YFtusW6o3yTAfFiMaR0FkudaiZO/BdT2HHrwxNWXaAduDgMSYYn/G1IydU
	qr/9XCziaxr3J7+lXoAtS+AxRGoPcDo=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-cIZyv3LLNziQgAasHeOStQ-1; Wed, 11 Sep 2024 01:04:25 -0400
X-MC-Unique: cIZyv3LLNziQgAasHeOStQ-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2db24468f94so3118622a91.1
        for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 22:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726031064; x=1726635864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubjMo8NwKL7SnNTWgd+Dm+pnLJ9UIJp5NBZ6jtgWJMo=;
        b=WeeGIw1PkKMDgwiLWotpe8OoqU1vU8h5SUW/l17hMtCkg3rvaJXm+4+CY3+6+C/8JC
         gBQqL+KGnXIA3q/V6I4wlyQ2NyQmbeMTNVuUhwLyvjHmRoAHQt5p8pMnpYE5bzwuHjO4
         q4C/CkQKH0wK8oty4wwSaWQMpIKlQH1wKNkM/nwMP4YdjmDyDGKjAsv647oPnvHPfT8t
         UZe4rIfpnPrfyRgJGgkYdMzzYXSctk5YbMP2Ffkz9QGcsVn0nhL6YLu/FB8Kj0GRgXjz
         39ekrA6dQ9iZ3aJjy+CBM5l5pVUn0nYVKgpBGi8g0ag/X8IUSqFV+2JV5mjZ+9UPmM+Y
         AEaw==
X-Forwarded-Encrypted: i=1; AJvYcCVwvM7Po6+Wnuwodl9eiS6emx1b69B33PfcxCXKREn39aZxmzKnE0DHRWKKkhjVkvYPl6gSnmn7DePCdAlqgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZoMjChL3qg1s+ixlgg+hRlhCHq1FdE59sM05zFX9ntUYB7fwo
	+HoVU18q+WzHj6Yl9yTLLxeKktT0IUmi0C+kE9T62kngasUKDJ/1YOPHQTn5RaqYg27y78/WNbb
	WOi8T9AlT3vq3dlEWs4w3Hw6sonUrHB607qujig93dC6bM16c0p4/sOQD8agVF8RBIhu4dZhzab
	NZ+57mV4YPdCMYf7kDFx4qT2jtO7xZ7ET15puTcpw=
X-Received: by 2002:a17:90b:4a46:b0:2d3:da6d:8330 with SMTP id 98e67ed59e1d1-2daffa3a743mr16929999a91.4.1726031064042;
        Tue, 10 Sep 2024 22:04:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEhQA1Rnh15a1yP4basuX2thNddNWej4E0h/6Y9RqShK69/COSB8T84MA7t+smmjU8PiA9H6G0pww64oalV8w=
X-Received: by 2002:a17:90b:4a46:b0:2d3:da6d:8330 with SMTP id
 98e67ed59e1d1-2daffa3a743mr16929967a91.4.1726031063414; Tue, 10 Sep 2024
 22:04:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240910170723.44537-1-parav@nvidia.com> <20240910142850-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87136FC9671ABFF7123A82CADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910162247-mutt-send-email-mst@kernel.org> <IA0PR12MB8713AC1D273671DF459FA254DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <8a42e214-59b1-4085-aec0-0f31be885525@amd.com> <IA0PR12MB871350EE73BFB2B8B60B7E97DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <CACGkMEtUvJhAq9Y-hZ8NroupJgarYhB8qz-cLXNQYrvnoGKgbQ@mail.gmail.com>
 <5d0cf855-ead0-46a4-8221-d41c0a3be15f@amd.com> <IA0PR12MB871329260A003AF902C78956DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
In-Reply-To: <IA0PR12MB871329260A003AF902C78956DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 11 Sep 2024 13:04:11 +0800
Message-ID: <CACGkMEuzWu9XZj00VQCeejvCe+XQYQntONUapo7CStDcXkyfdA@mail.gmail.com>
Subject: Re: [PATCH] admin: Enable driver to send admin commands before DRIVER_OK
To: Parav Pandit <parav@nvidia.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	Shahaf Shuler <shahafs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 12:45=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
> > From: Zhu Lingshan <lingshan.zhu@amd.com>
> > Sent: Wednesday, September 11, 2024 10:12 AM
> >
> > On 9/11/2024 12:38 PM, Jason Wang wrote:
> > > On Wed, Sep 11, 2024 at 12:12=E2=80=AFPM Parav Pandit <parav@nvidia.c=
om>
> > wrote:
> > >>
> > >>> From: Zhu Lingshan <lingshan.zhu@amd.com>
> > >>> Sent: Wednesday, September 11, 2024 9:30 AM
> > >>> To: Parav Pandit <parav@nvidia.com>; Michael S. Tsirkin
> > >>> <mst@redhat.com>
> > >>> Cc: virtio-comment@lists.linux.dev; cohuck@redhat.com; Shahaf Shule=
r
> > >>> <shahafs@nvidia.com>
> > >>> Subject: Re: [PATCH] admin: Enable driver to send admin commands
> > >>> before DRIVER_OK
> > >>>
> > >>>
> > >>>
> > >>> On 9/11/2024 11:37 AM, Parav Pandit wrote:
> > >>>>> From: Michael S. Tsirkin <mst@redhat.com>
> > >>>>> Sent: Wednesday, September 11, 2024 2:06 AM
> > >>>>>
> > >>>>> On Tue, Sep 10, 2024 at 07:01:08PM +0000, Parav Pandit wrote:
> > >>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> > >>>>>>> Sent: Wednesday, September 11, 2024 12:02 AM
> > >>>>>>>
> > >>>>>>> On Tue, Sep 10, 2024 at 08:07:23PM +0300, Parav Pandit wrote:
> > >>>>>>>> Currently the driver can operate administration commands using
> > >>>>>>>> administration virtqueues. Administration virtqueues must be
> > >>>>>>>> enabled before it reached DRIVER_OK stage similar to all other
> > >>>>>>>> queues. This is a limiting factor.
> > >>>>>>>>
> > >>>>>>>> Many of the device functionalties needs to be discovered and
> > >>>>>>>> configured early enough before the driver reaches the DRIVER_O=
K
> > >>>>> stage.
> > >>>>>>>> Some examples are:
> > >>>>>>>>
> > >>>>>>>> a. driver wants to dynamically create the virtqueues of virtio=
-net
> > >>>>>>>>    device with more parameters, for example header data split,
> > >>>>>>>>    multiple physical addresses.
> > >>>>>>>>    Here, the driver needs to tell PCI device early enough that=
 it no
> > >>>>>>>>    longer uses queue_* registers for non admin queues.
> > >>>>>>>>
> > >>>>>>>> b. driver wants to discover these features and related attribu=
tes
> > >>>>>>>>    early enough so it has chance to decide to proceed via admi=
n
> > >>>>>>>>    cmd interface or proceed to DRIVER_OK and follow the curren=
t
> > flow.
> > >>>>>>>>
> > >>>>>>>> To overcome these limitations, introduce a feature bit that
> > >>>>>>>> enables the driver to send capabilities related admin commands
> > >>>>>>>> before DRIVER_OK via the available interface such as
> > >>>>>>>> administration
> > >>>>> virtqueue.
> > >>>>>>>> Signed-off-by: Parav Pandit <parav@nvidia.com>
> > >>>>>>> We were there in 1.0 and it's messy. And next thing you do, you
> > >>>>>>> will
> > >>>> Also if you can explain what exactly is the mess, if there is one?
> > >>> As far as I can see, the spec says:
> > >>> Set the DRIVER_OK status bit. At this point the device is =E2=80=9C=
live=E2=80=9D.
> > >>>
> > >> This patch upgrades this detail. Please read through.
> > >>
> > >>> And no vqs are active before DRIVER_OK. How can the device assume
> > >>> that the driver is ready before DRIVER_OK?
> > >> Device does not assume.
> > >> When the feature described in this patch is negotiated, device knows=
 that
> > AQ will be live before DRIVER_OK.
> > >>
> > >>> Why admin vq is special?
> > >> Because it is used to do fundamental device and driver capabilities
> > discovery.
> > > Then you need another transport or a control device.
> > So Maybe it is a good chance for me to continue the "transport vq" work=
?
> Nop.
> AQ has delivered what all was required uniformly for sw based device, PCI=
 PF, PCI VFs.
> Lets first understand the motivation of the complication from Jason.

It's not a complication but a simplification because "fundamental
device and driver capabilities discovery" has already been the charge
of the transport.

Thanks

