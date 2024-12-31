Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85796944E
	for <virtio-comment@lists.linux.dev>; Tue, 31 Dec 2024 05:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735623185; cv=none; b=EJt+f7/ASLLrfagGA2c7nYZJ2vXTEcF/pUrZqYRJ24gGjp8jq7EtQbl4EA5iGwV2s1azdzj++DKuQnnDRd4DdDryW2LX5dbdqK/ORQttGGXZwChbWFnaJmJlEB2iT0iOs8OnOZW00fNDUaoiQQ6Bp/GGhC5tB9bTcGfRvy5/psM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735623185; c=relaxed/simple;
	bh=6rW+C5YVN5ygPIhaVrorezdBUd5qCiCNrmXiXDTyc+4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K/M5YF9Bu7/uTzwaNOOb8A+spXCWNDsGDFRy64xwqA2sqMC+9eewA4/8zfHQx48LKtNZQx5vtr7je7EpPEMQxTzyp+CBeSLiz+dPwwsWaUemLoz5laXQJsN61KG4dHZ1UlQzRrTD+Pj4FG71sYIcj/QiKolvJBnuF8MeV6zpZjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxKDz5Em; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxKDz5Em"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21644aca3a0so35198335ad.3
        for <virtio-comment@lists.linux.dev>; Mon, 30 Dec 2024 21:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735623183; x=1736227983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kqrMwo6ZpuCXC22Ec3vWxeBDkeOpERUkFcBWzlDmYU=;
        b=YxKDz5EmIoVEMcJxV6B2JGZsu9HgE+ow/ykptFX6gun7zFb0sX0IsfkhlKbBWQLGnx
         aUkIaIdsdlrRHjM+c2HEN57Ram5GkniL7bRy2zi66Jq+EmkqKe30EBxiT/Cu8r+QAXBz
         w9mZ5BG63nD6qA2NFnIn1VcQZ2wa6FRxiPom9fs9lEHu1VNWn1MtTQqFFUn/OttxrJVB
         DjE4gGQmdOUMkZQMCx4ArnYbxtDyJSzy/zV2F/DHdXIflH1LAjxrLXkORU7IctF8ywxT
         mGfGIAd9T9LI5nuz/X4TeSuBBSCfNHt3DZHBh6qaCqJl9ci7chNBOx6bDYWHdZUXr4wE
         cIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735623183; x=1736227983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kqrMwo6ZpuCXC22Ec3vWxeBDkeOpERUkFcBWzlDmYU=;
        b=RfJ9FgmSeL0XcA6s6gJessvy29Fd5D/Gpp8U0ZI07rrqBbR9TFxeDoddyPm7KdSOr2
         PUf8iXSP/8wPJryD3tNSJpvgkmLz115gMJmkVTvKa1Qb3LtGTslPqhIqwxOofpfax6/2
         DML3Sl78DIq2xz/kmW+XKnnUD0QPFL/v2HoLP1tuZJukS4c1JEU4I4BUlBLNXX9D1JAe
         QQXLe8UrV69MeMr6YsbmGhzQ6eEqz36n5yjpLTZZvi3xYegiXoPn46P1ZpmO+zKHnw36
         GQC9WpFPe8GanmOPtxPp6AZoAbjL1rNRxEtcw/Cs3WuJ8X3QmH2NSfD6TIL1b7G8p/8m
         cuUA==
X-Forwarded-Encrypted: i=1; AJvYcCVOxxqG45OamfC27r2H1G1uPwighxsCmayJd537ZYX9Mma0xc1jgoUT041+OAf1swuB6BNp8hp+jPDbUwpMYA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6IwTiejyIm1vftzGONjSvHsBSPi60+sajpU7J130lZdILPDV8
	kImco4Bg3vweD2t2xdAEcvifYjKeXZh8AEZkbfSC7zOd0INioDzL
X-Gm-Gg: ASbGncuwv3I0oGPt3rdvVXjnwhuAl9DmveixqxhgVcCHitwHEBDcCJyc5MLRdBWGac5
	tNMwWrHp1+CgxYkeoxc3MWTW0la9fZshoOyhuMvT5zwZpbC2BlhWWEP+DlWncK01Rlq52iPaApQ
	Ni2klk0P7iRlm7wjDaE3uwBINSCVwVMRh83Wen4KacqPFkfWFmQibFQolI1cBinqTPn8dKAs1Ge
	rGbTkBsPB/ZgyFqHsRA4tc5oFIh+a43oNp7brhD3Qx60Wa/+IdTDMo+g6ZkZj9vfWTt+Hzk1VvL
	IPM=
X-Google-Smtp-Source: AGHT+IHwcmGNY4OQODp5Cp+eW60NXNJ7qqCMwiXQb7vuPwxePBdh/436yd1E9VcRe54zmYlJp4mqhQ==
X-Received: by 2002:a05:6a20:e68b:b0:1e0:e000:ca60 with SMTP id adf61e73a8af0-1e5e080de50mr61406137637.28.1735623182404;
        Mon, 30 Dec 2024 21:33:02 -0800 (PST)
Received: from devant.antgroup-inc.local ([47.89.83.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad815835sm20886896b3a.27.2024.12.30.21.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 21:33:01 -0800 (PST)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: parav@nvidia.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	sgarzare@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v5] virtio-vsock: Add support for multi devices
Date: Tue, 31 Dec 2024 13:32:48 +0800
Message-Id: <20241231053248.850241-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CY8PR12MB71951ECD54EE431247FC1E13DC092@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <CY8PR12MB71951ECD54EE431247FC1E13DC092@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> > From: Xuewei Niu <niuxuewei97@gmail.com>
> > Sent: Thursday, December 5, 2024 11:59 AM
> > 
> > Hi Parav,
> > 
> > Sorry for the late reply. I was super busy in the past few weeks. I hope things
> > become more regular from now on.
> > 
> > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > Sent: Thursday, October 24, 2024 12:38 PM
> > > >
> > > > This patch brings a new feature, called "multi devices", to the
> > > > virtio vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature
> > bit, and a "index"
> > > > field to the config for the virtio vsock.
> > > >
> > > > == Motivition ==
> > > >
> > > > Vsock is a lightweight and widely used data exchange mechanism
> > > > between host and guest. Kata Containers, a secure container runtime,
> > > > leverages the capability to exchange control data between the shim and the
> > kata-agent.
> > > >
> > > > Currently, the virtio-vsock only supports one device, resulting in
> > > > the following
> > > > limitations:
> > > >
> > > > * Poor performance isolation: All vsock connections share the same
> > > > virtqueue.
> > > Do you have rough estimates on how much performance is affected (or is
> > poor) due to single queue?
> > > I am not familiar vsock application space.
> > > It is something like 10K socket msg/sec or 10 million socket msg/sec due to
> > single queue?
> > 
> > Yes, but the data shows the performance doesn't grow much. 
> If so, please update the commit log description to not have performance as the motivation.
> Rather performance as side gain.
> Please write it as main motivation is ... TSI etc details.

Will do.

> > I think we can
> > skip the performance part for now. Here are reasons:
> > 
> > - The biggest motivition to make us support this feautre is mutli-backends
> >   support. In the Kata Containers cases, we'd like to use Transparent
> >   Socket Impersonation (TSI) to use virtio-vsock for data plane. The
> >   limitation of the single vsock device is quite clear.
> Do you mean TSI functionality requires multiple vsock device as the only way forward?
> I thought even one vsock device can do TSI too?
> Which information is mandatory from multiple devices to do TSI?

Yes. TSI doesn't rely on this feature. However, we have finished a POC that
integrates vhost-user-vsock with Ztunnel, a per-host proxy for Istio
service mesh. The diagram is as following.

                                                                                
                             ╔═══════════════════════════════════════════════╗  
                             ║ VMM                                           ║  
                             ║                                               ║  
                             ║   ╔═════════════╗           ╔═════════════╗   ║  
                             ║   ║    device   ║ <════════ ║  kata-agent ║   ║  
    ╔════════════════════╗   ║   ╚═════════════╝virtio-vsock═════════════╝   ║  
    ║                    ║   ║                                               ║  
    ║  Ztunnel           ║   ║                                               ║  
    ║                    ║   ║                                               ║  
    ║    ╔═════════════╗ ║   ║    vhost-user-vsock         ╔═════════════╗   ║  
    ║    ║    device   ║ ║ <══════════════════════════════ ║   user app  ║   ║  
    ║    ╚═════════════╝ ║   ║                             ╚═════════════╝   ║  
    ║                    ║   ║                                               ║   
    ╚════════════════════╝   ╚═══════════════════════════════════════════════╝   
                                                                                
Kata-agent is a required component to manage containers in Kata Containers.
It uses virtio-vsock to communicate with the shim.

The device for networking is offloaded to the Ztunnel using vhost-user
protocol in order to bypass network stacks on both host and guest. We can't
achieve this without the multi-device feature.

> > - This feature gives vsock device the capability to improve performance.
> >   Apart from the driver side, optimizations on the VMM side are also
> >   required. For example, VMM spawns an exclusive thread for each vsock
> >   device. But we don't have enough time to do that.
> > - Stefano said that they have a plan to add support multi-virtqueues in the
> >   feature to enhance the isolation of vsock devices. We are doing the same
> >   thing, but with different approaches.
> > 
> > > > By the way, although multi-queues can solve this problem, they do
> > > > not conflict.
> > > > * Cannot enable more than one backend: Virtio-vsock, vhost-vsock,
> > > > and vhost-user-vsock cannot be enabled simultaneously on the transport.
> > > >
> > > > We'd like to transfer networking data, based on TSI (Transparent
> > > > Socket
> > > > Impersonation) technique, over vsock via the vhost-user protocol to
> > > > reduce overhead. However, by default, the vsock device is occupied
> > > > by the kata- agent, a control component for Kata Containers.
> > > >
> > > > == Typical Usages ==
> > > >
> > > > Assuming there are two virtio-vsock devices on the guest, with CIDs
> > > > 3 and 4 respectively. And the device with CID 3 is default.
> > > >
> > > > ==== Guest -> Host ====
> > > >
> > > > Use the device with CID 3.
> > > >
> > > > ```c
> > > > fd = socket(AF_VSOCK);
> > > > bind(fd, 3, -1);
> > > > connect(fd, 2, 1234);
> > > > n = write(fd, buffer);
> > > >
> > > > // or use default (no bind)
> > > > fd = socket(AF_VSOCK);
> > > > connect(fd, 2, 1234);
> > > > n = write(fd, buffer);
> > > > ```
> > > >
> > > > Use the device with CID 4.
> > > >
> > > > ```c
> > > > fd = socket(AF_VSOCK);
> > > > bind(fd, 4, -1);
> > > > connect(fd, 2, 1234);
> > > > n = write(fd, buffer);
> > > > ```
> > > Above and below example is not using the index that you are introducing in
> > this patch.
> > > Can you please elaborate?
> > 
> > When we have many vsock devices, we need to know the position of those
> > devices. The devices are arranged in a (linked) array, see below:
> How does the driver know how many devices would be accessible to the driver?
> I suppose it does not need to know it. It can just work with current number of active devices. Isn't it?

Seems like it is not very clean here.

Yes, the driver doesn't need to know it.

The "index" is not the real index of devices. It is a kind of
ordering for devices. The device with less index is at the front of other
devices in the device list. But the real index depends on how many devices
are discovered.

For example, there are three devices, vsock device (cid=4, index=4), vsock
device (cid=3, index=5), vsock device (cid=5, index=1). The driver
maintains a linked list to store the devices.

Assuming that the driver firstly discovered the vsock device(4,4), then
place it in the first place.

```
[real index 0]: vsock device (cid=4, index=4) <default device>
```

Then, the vsock device (3,5) was discovered. The driver should place it in the
second place, as its index 5 is greater.

```
[real index 0]: vsock device (cid=4, index=4) <default device>
[real index 1]: vsock device (cid=3, index=5)
```

Finally, the vsock device (5,1) was discovered. The driver should place it
in the first place, as its index 1 is less than the previous devices.

```
[real index 0]: vsock device (cid=5, index=1) <default device>
[real index 1]: vsock device (cid=4, index=4) 
[real index 2]: vsock device (cid=3, index=5)
```

The "index" in device's config space is a logical index to be used for
sorting.

> In other words, say, if the first vsock device discovered, is index=1, can cid==4 make progress with it?

Yes. If device (3,1) is discovered first, the device (4,0) can make
progress with it. Apart from that, the final order is the same with the
below.

Please let me know if I misunderstood.

> > 
> > ```
> > [0]: vsock device (cid=4, index=0) <default device>
> > [1]: vsock device (cid=3, index=1)
> > ```
> > 
> > The index is only used for determining the device position; for data
> > transmission, `bind`, `connect`, etc., the CID is used.
> > 
> So why not driver maintain some linked list of devices and use one?
> The relation of cid and device index is not clear if there is one.
> If none, the device index is just driver internal detail, right?

Yes, the driver does maintain a linked list. However, the device should be
able to control its position in the list. IMHO, it can't be the driver
internal detail.

> > > If the binding is based on the CID, than why the new index needed?
> > 
> > Think about the case of using the CID to determine the device position. 
> Do you mean CID is used to derive the device index?
> If yes, if there is one to one mapping, than the device identified by the CID itself can be used directly, isn't it?

Yes, but it is a counterexample. I mean using CID as the index is not a
good idea. 

I think the "index" is used to establish the one-to-one mapping. If there
is only CID, I don't have an idea about how to establish the mapping.

> > If we
> > want to change the position, we have to change the CID. If the peer doesn't
> > realize the change, the connection will be broken. So we have to decouple the
> > CID and the position, one for data transmission, one for device management.
> > That is why we need the index.
> > 
> > ```
> > ==from==
> > [0]: vsock device (cid=4, index=0) <default device>
> > [1]: vsock device (cid=3, index=1)
> > ==to==
> > [0]: vsock device (cid=3, index=0) <default device>
> > [1]: vsock device (cid=4, index=1)
> > ```
> > 
> How is this mapping dynamically changed? Is this driver only decision?

By hot-plug/hot-unplug devices. So this is device-only decision (or VMM
side).

> > > Or the example is stale here in commit log?
> > 
> > No. It's up to date.
> > 
> > >
> > > ==== Host -> Guest ====
> > >
> > > The usage is no changes in this case. Send to device with CID 3.
> > >
> > > ```c
> > > fd = socket(AF_VSOCK);
> > > connect(fd, 3, 1234);
> > > n = write(fd, buffer);
> > > ```
> > >
> > > Send to device with CID 4.
> > >
> > > ```c
> > > fd = socket(AF_VSOCK);
> > > connect(fd, 4, 1234);
> > > n = write(fd, buffer);
> > > ```
> > >
> > > I've pushed a version of code for the implementation of multi devices
> > > to lkml [1].
> > >
> > > [1]
> > 
> > [..]
> > 
> > > >
> > > > Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> > > > ---
> > > >  device-types/vsock/description.tex | 46
> > > > ++++++++++++++++++++++++++++--
> > > >  1 file changed, 44 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/device-types/vsock/description.tex b/device-
> > > > types/vsock/description.tex index 7d91d15..f2e663b 100644
> > > > --- a/device-types/vsock/description.tex
> > > > +++ b/device-types/vsock/description.tex
> > > > @@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types /
> > > > Socket Device / Feature bits}  \item[VIRTIO_VSOCK_F_STREAM (0)]
> > > > stream socket type is supported.
> > > >  \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is
> > supported.
> > > >  \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is
> > > > not implied.
> > > > +\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple socket devices are
> > > > supported.
> > > An individual device cannot indicate what other devices are supported.
> > > The question is, when multiple devices are accessible to a single driver, how
> > should driver choose which device to use?
> > > This is the question that driver needs to solve based on certain information.
> > >
> > > Therefore, the only thing needed in this patch is a feature bit to say, from
> > device point of view is:
> > >
> > > VIRTIO_VSOCK_DEV_INDEX This feature indicates that device configuration
> > space has device index.
> > >
> > > And somehow application chooses which device to use to transport the vq
> > entries.
> > >
> > > Right?
> > 
> > `VIRTIO_VSOCK_F_MULTI_DEVICES` is to let driver know that the device
> > supports multi-devices feature: read the index field from the config space,
> > prepare an array to store multiple devices, deny device without the feature,
> > etc.
> > 
> How does driver prepare the array, if it does not know the array size?

The devices are stored in a linked list, so it does not need to know the
array size.

> What if two PCI hardware devices are plugged in, from two different physical cards and each has the duplicate index?

The latter one will be denied by the driver because of the conflicts.

> > IMHO, `VIRTIO_VSOCK_F_MULTI_DEVICES` is better than
> > `VIRTIO_VSOCK_DEV_INDEX`.
> > 
> > > >  \end{description}
> > > >
> > > >  \drivernormative{\subsubsection}{Feature bits}{Device Types /
> > > > Socket Device / Feature bits} @@ -34,6 +35,13 @@ \subsection{Feature
> > > > bits}\label{sec:Device Types / Socket Device / Feature bits}
> > > > VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
> > > > VIRTIO_VSOCK_F_STREAM has also been negotiated.
> > > >
> > > > +If a device without VIRTIO_VSOCK_F_MULTI_DEVICES has been
> > > > +registered, the driver SHOULD ignore all subsequent devices.
> > > > +
> > > At driver level in virtio spec, there is no concept of registered.
> > > It should be something like
> > > If the device index is not present, the driver SHOULD pick some default
> > device etc.
> > 
> > "Pick some default device" is not much accurate. When this case happened, it
> > means multi-devices feature is disabled, then the driver should ignore all
> > subsequent devices.
> Multiple vsock devices belong to some single group is what is needed, if that definition is needed.
> And just providing an index does not help for it in my view.
> 
> Is this some kind of multi-pathing?
> If so, providing some common such identification is necessary between two devices to indicate they are part of some group.
> 
> Please explain more I misunderstood.

In the term of vsock, there is no concept for "group".

I mean the driver will fallback to single-device mode if the device index
is not present. In this case, any subsequent devices will be denied. In
other words, there is only one vsock device avilable in the driver.

> > Will replace the term "register", see below:
> > 
> > If a device without VIRTIO_VSOCK_F_MULTI_DEVICES has been present, the
> > driver SHOULD ignore all subsequent devices.
> > 
> 
> > > > +If a device with VIRTIO_VSOCK_F_MULTI_DEVICES has been registered,
> > > > +the driver SHOULD accept other devices only if they expose
> > > > +VIRTIO_VSOCK_F_MULTI_DEVICES.
> > > > +
> > > >  \devicenormative{\subsubsection}{Feature bits}{Device Types /
> > > > Socket Device / Feature bits}
> > > >
> > > >  The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM
> > > > feature.
> > > > @@ -52,6 +60,7 @@ \subsection{Device configuration
> > > > layout}\label{sec:Device Types / Socket Device  \begin{lstlisting}
> > > > struct virtio_vsock_config {
> > > >  	le64 guest_cid;
> > > > +	le16 index;
> > > >  };
> > > >  \end{lstlisting}
> > > >
> > > > @@ -77,11 +86,36 @@ \subsection{Device configuration
> > > > layout}\label{sec:Device Types / Socket Device  \hline
> > > > \end{tabular}
> > > >
> > > > +The \field{index} field indicates index of a device, and is
> > > > +required for each device when VIRTIO_VSOCK_F_MULTI_DEVICES feature
> > > > +has been
> > > > negotiated.
> > > This is not needed. A driver should be able to make choice on which device to
> > use.
> > 
> > IMHO, this is necessary. It is a rule that DEVICE must provide the index if it
> > want to enable the multi-devices feature. It's not a rule for the driver.
> > 
> > BTW, making choice on which device to use by the driver is according to CID.
> So let driver maintain its own data structure without the device index.
> Why won't it work?

Because the device (VMM side) should be able to decide the postion of the
devices. And the driver should follow the device's decision.

> > The index is only used to determine position in the driver's device list. (This is
> > the same as the previous explanation.)
> > 
> > > > +The \field{index} is 16 bits in size, enabling support for up to
> > > > +65,536 devices.
> > > > +
> > > Bit width is visible, just mentioning maximum device size is good enough.
> > 
> > Will update in the next version.
> > 
> > > > +The source socket is allowed to not be bound to any CID. It is
> > > > +required for the driver to choose a CID for the socket. If
> > > > +VIRTIO_VSOCK_F_MULTI_DEVICES is not negotiated, the one and only
> > > > +device's CID is used. If VIRTIO_VSOCK_F_MULTI_DEVICES is
> > > > +negotiated, the driver uses the default device's. In this case, the
> > > > +driver selects the device with the lowest index as the default.
> > > > +
> > > If socket can choose the CID, why does it need new index?
> > > Its confusing to see relation of CID and index here.
> > > Can you please explain?
> > 
> > See "When we have many vsock devices, we...".
> > 
> > > > +\devicenormative{\subsubsection}{Device configuration
> > > > +layout}{Device Types / Socket Device / Device configuration layout}
> > > > +
> > > > +When VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the device MUST
> > > > offer
> > > > +an \field{index}, which MUST NOT be same with the \field{index} of
> > > > +other devices.
> > > > +
> > > > +When VIRTIO_VSOCK_F_MULTI_DEVICES is not negotiated, the device
> > > > SHOULD
> > > > +NOT offer an \field{index}.
> > > > +
> > > This should be MUST.
> > 
> > Will update.
> > 
> > > I don't see a need to write this.
> > > In other words,
> > >
> > > If VIRTIO_VSOCK_F_DEV_INDEX is offered, field index is supported.
> > 
> > This part gives two rules:
> > 
> > - The device MUST not provide the index that has been already used.
> > - If VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the device MUST offer
> >   the index field (if not offered, the driver might read data outside the
> >   config space, as the sizes are different).
> > 
> > > >  \subsection{Device Initialization}\label{sec:Device Types / Socket
> > > > Device / Device Initialization}
> > > >
> > > >  \begin{enumerate}
> > > >  \item The guest's cid is read from \field{guest_cid}.
> > > >
> > > > +\item If VIRTIO_VSOCK_F_MULTI_DEVICES has been negotiated, the
> > > > device's
> > > > +index will be read from \field{index}. If not, the device's index
> > > > +will be ignored.
> > > > +
> > > >  \item Buffers are added to the event virtqueue to receive events
> > > > from the device.
> > > >
> > > >  \item Buffers are added to the rx virtqueue to start receiving packets.
> > > > @@ -167,6 +201,10 @@ \subsubsection{Addressing}\label{sec:Device
> > > > Types / Socket Device / Device Opera  consists of a (cid, port
> > > > number) tuple. The header fields used for this are  \field{src_cid},
> > > > \field{src_port}, \field{dst_cid}, and \field{dst_port}.
> > > >
> > > > +If at least one device has negotiated VIRTIO_VSOCK_F_MULTI_DEVICES,
> > > > +and the source socket is not bound to any CID, then \field{src_cid}
> > > > +should be set to the default device's CID.
> > > > +
> > > >  Currently stream and seqpacket sockets are supported. \field{type}
> > > > is 1
> > > > (VIRTIO_VSOCK_TYPE_STREAM)  for stream socket types, and 2
> > > > (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
> > > >
> > > > @@ -233,8 +271,12 @@ \subsubsection{Receive and
> > > > Transmit}\label{sec:Device Types / Socket Device / De
> > > >
> > > >  \drivernormative{\paragraph}{Device Operation: Receive and
> > > > Transmit}{Device Types / Socket Device / Device Operation / Receive
> > > > and Transmit}
> > > >
> > > > -The \field{guest_cid} configuration field MUST be used as the
> > > > source CID when -sending outgoing packets.
> > > > +The \field{guest_cid} configuration field MUST be used as the
> > > > +source CID when sending outgoing packets.
> > > > +
> > > > +When VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the source CID
> > > > MUST be
> > > > +one of the \field{guest_cid} configuration field of the multiple
> > > > +devices handled by the driver.
> > > >
> > > If the guest_cid is used to distinguish between devices, why the new field
> > index is needed?
> > > Can guest_cid be sufficient?
> > 
> > See above "When we have many vsock devices, we..." as well. If something is
> > not clear or incorrect, please feel free to let me know.
> > 
> > > >  A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received
> > > > with an unknown \field{type} value.
> > > > --
> > > > 2.34.1
> > > >
> > 
> > Thanks for your comments!
> > 
> > Best Regards,
> > Xuewei

Thanks,
Xuewei
