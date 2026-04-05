Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6753F36C5BE
	for <virtio-comment@lists.linux.dev>; Sun,  5 Apr 2026 22:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775428143; cv=none; b=AOBuPPHHM8MametEycFIZHlGeITz+Q6d5gqySF7a/KngvSShS174JVbCiiS8RQi+NrWPG0u+wpgZQLx+Mml8XjjWhlEh0eUxaZ96Gd3rAp7wBsi7xkizIHlvbrJzChes5PeEoiBZu4r3vLmqDzzBL84krJczu3yjdUV9+zh7jhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775428143; c=relaxed/simple;
	bh=wlRdI7WAa20ZzjYP3mfWweriO4Hjcxxr0FM4KnRsogk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ngtvzMNs4KKwx8O6NoiANTRhU7rNAckda13pAa9VofpvXagd61f3xJnAUTDhV+o2tsBNsII8/w4HcLknZgDTxrP8C3J+24VtYSK2mzIJVMBRiXXdss0mJoRKsAfhYKCT5GAaZGL6vOHWSBLRIyhfC3qQ43iBDBDf/cwmDsWlGXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQPjgJlj; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQPjgJlj"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64eee7b83cfso2612560d50.3
        for <virtio-comment@lists.linux.dev>; Sun, 05 Apr 2026 15:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775428141; x=1776032941; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H7oWUiEuPTRGcVQxOVsIOZjFr9O4AbAszAUr0+ezhaI=;
        b=AQPjgJlje3vp4kCkK4kBVJGttqOEq1km/rrQga6dej51wZekFUZu95qIuAdLJCd6jc
         YwKAg/YHkDxETPNiOoHEBgDD2h/dfgNfitcLR8MZByBy8CbcHDV7x48RvjnyqnHGJ7JE
         YrCuJxAvmZWFM1aGL5Fdi9fIZveAjsGtTOmWgBj0tEHDmyXB8I7AeoqyDRE4BzFMVBFJ
         THuYVY5irKAm4U93Pu9aZPL3C/NJxSYavJEZbbrNzXt3jFc0fZWBsfu31T3J6kdTeYSY
         +wYDETUsdLd4yxqjJzuZV1ZktarK4VpfhZ99Era26S3M5AUIXf4ibgaKduXRsX3Zwep4
         MK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775428141; x=1776032941;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7oWUiEuPTRGcVQxOVsIOZjFr9O4AbAszAUr0+ezhaI=;
        b=qwPSce69UR/yQ6izkECXvUH9wI5qljydzmZQmfGh+NzapB3t054akua1TokNtGpkKI
         ZDuhTHdD0dtAzCXAs87MS6AfNATpbZvIhWWDSMxjcGPV0hqpmAmGRmropEV3DROUmdvD
         v5mtJ88erJr4jonWz6rpXA2LN50jjKm+Ess9UcTlAMwlhWWRACHeT2vJGxFjHsimgN2M
         scxgOHsHOPo/07dbAyJSGBBlyUCjyJA4T/HLtQe9CA8FVykg/Q+UHyW12SrbRhha7dNV
         MR77s+vs2wUeASuOaOgIG+LqNjlG2bfS5U4+pJNBqQB249w26JFsSiDx/zfKqE0ec3HE
         cwSA==
X-Gm-Message-State: AOJu0Yw0RsD+IffOmmGwKvoC+4oTdqtIidZkeWVYjhMKX+3kLGEaxVjw
	ADaoRNLfD2sjlrktwhWYAS09GWEaUiErzqrZKm3HylXN8sC9635GCc1G
X-Gm-Gg: AeBDievvBPenpfIOeP3G6hUuDEww+gq+44c+/MHBSd5H0CPc9PCN5r/WeChDuLJbu6V
	QJYwB05uQ3RodvQADfpEusN/+30fkHBeZ4oOukct7nGZQFzqkW6W96UMSUilfvrzeYBTkT2hevP
	qQMaHAr4ZqTrStkP4DxlBeitWg1b3YJhNxfc+HK7djfP6s8x3XC+T+D+6TyH9ErQ2Rk0epjpOcO
	rmgqVa1hW1SV+/L4DqBQGVf/b6TUitGSh+9Nk9gPax84ALWG4TRhHdXZ0h7oKszMbBrM+3Mb0BN
	OCCQcJMsQvL+E4zK7ZlXsMpEmIUzBTB3j4amk2LEXvJkTrMnumD7+4hf23esNxjfk2aOUwuhF3K
	rytrrT515hkNgfPhcysRiVGNOyyo+8/buhJQ6Tr0N57zXPzdqP2jtOxL/HhNXm9Ugh9Z46TJuL9
	MjlN6G2299W5PXzo0KjfTUn8SDHX7nL8Q0grRy6ANZVwla/5QVpCEWZGb3bwrA1L6y+GBxAuVdz
	HZ5RKSzKRD71XHsltnfEPkv5YzApdAZvTku
X-Received: by 2002:a05:690c:3587:b0:79a:be42:661e with SMTP id 00721157ae682-7a4d3fc4dbemr109006267b3.24.1775428141130;
        Sun, 05 Apr 2026 15:29:01 -0700 (PDT)
Received: from [10.138.34.110] (h96-60-57-129.cncrtn.broadband.dynamic.tds.net. [96.60.57.129])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36e42fec3sm45936517b3.4.2026.04.05.15.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 15:29:00 -0700 (PDT)
Message-ID: <005c6635-9861-48fd-a2f7-225a743f9f10@gmail.com>
Date: Sun, 5 Apr 2026 18:28:56 -0400
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Should there be a mode in which the virtqueue -> MSI mapping is
 fixed?
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
References: <e8a35333-589a-4a00-8e1a-32d497171e56@gmail.com>
 <20260404205140-mutt-send-email-mst@kernel.org>
 <b01e0d9b-086b-4a60-8ada-1ec895d46139@gmail.com>
 <20260405155501-mutt-send-email-mst@kernel.org>
 <700f6f7c-53d6-4023-9a5f-1296eacfff37@gmail.com>
 <20260405170510-mutt-send-email-mst@kernel.org>
 <3947d888-47b2-4b6a-9f05-3be9c00061be@gmail.com>
 <20260405174833-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260405174833-mutt-send-email-mst@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------J0Ffgr6i3k6o4ZK0nGxnYvU1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------J0Ffgr6i3k6o4ZK0nGxnYvU1
Content-Type: multipart/mixed; boundary="------------O6LwvM4mkVBp3pJBFe6K07pA";
 protected-headers="v1"
Message-ID: <005c6635-9861-48fd-a2f7-225a743f9f10@gmail.com>
Date: Sun, 5 Apr 2026 18:28:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Should there be a mode in which the virtqueue -> MSI mapping is
 fixed?
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
References: <e8a35333-589a-4a00-8e1a-32d497171e56@gmail.com>
 <20260404205140-mutt-send-email-mst@kernel.org>
 <b01e0d9b-086b-4a60-8ada-1ec895d46139@gmail.com>
 <20260405155501-mutt-send-email-mst@kernel.org>
 <700f6f7c-53d6-4023-9a5f-1296eacfff37@gmail.com>
 <20260405170510-mutt-send-email-mst@kernel.org>
 <3947d888-47b2-4b6a-9f05-3be9c00061be@gmail.com>
 <20260405174833-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260405174833-mutt-send-email-mst@kernel.org>

--------------O6LwvM4mkVBp3pJBFe6K07pA
Content-Type: multipart/mixed; boundary="------------hhMEpAMT0RHoM4kIxeJkvgPu"

--------------hhMEpAMT0RHoM4kIxeJkvgPu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4/5/26 17:50, Michael S. Tsirkin wrote:
> On Sun, Apr 05, 2026 at 05:47:19PM -0400, Demi Marie Obenour wrote:
>> On 4/5/26 17:09, Michael S. Tsirkin wrote:
>>> On Sun, Apr 05, 2026 at 04:58:39PM -0400, Demi Marie Obenour wrote:
>>>> On 4/5/26 16:15, Michael S. Tsirkin wrote:
>>>>> On Sun, Apr 05, 2026 at 01:50:25PM -0400, Demi Marie Obenour wrote:=

>>>>>> On 4/4/26 20:56, Michael S. Tsirkin wrote:
>>>>>>> On Sat, Apr 04, 2026 at 05:19:41PM -0400, Demi Marie Obenour wrot=
e:
>>>>>>>> Cloud Hypervisor's vhost-user frontend does not implement MSI-X
>>>>>>>> properly [1].  Specifically:
>>>>>>>>
>>>>>>>> 1. Reads from the Pending Bit Array (PBA) always return 0.
>>>>>>>> 2. Changes to the MSI associated with a virtqueue after the devi=
ce
>>>>>>>>    is activated are ignored.
>>>>>>>>   =20
>>>>>>>> Amazingly, there have not been any reports of this causing break=
age.
>>>>>>>> I have a fix for the first [2], which actually decreases the amo=
unt
>>>>>>>> of code.  However, the second is trickier and I'm tempted to not=

>>>>>>>> bother unless it causes real-world problems.
>>>>>>>>
>>>>>>>> Are there real-world drivers that will run into either of the ab=
ove
>>>>>>>> bugs?  Linux seems to only choose anything else as a fallback, w=
hich
>>>>>>>> presumably is not triggered.
>>>>>>>>
>>>>>>>> [1]: https://github.com/cloud-hypervisor/cloud-hypervisor/issues=
/7813
>>>>>>>> [2]: https://github.com/cloud-hypervisor/cloud-hypervisor/pull/7=
963
>>>>>>>
>>>>>>> It will sometimes trigger.
>>>>>>
>>>>>> Would it be possible to provide an example?  A reproducible test
>>>>>> case would be ideal, but conditions under which this will trigger
>>>>>> are also sufficient.
>>>>>
>>>>>
>>>>> I am not sure what does "is activated" mean.
>>>>> For example, on latest Linux:
>>>>>
>>>>>         vq =3D vp_find_one_vq_msix(vdev, avq->vq_index, vp_modern_a=
vq_done,
>>>>>                                  avq->name, false, true, &allocated=
_vectors,
>>>>>                                  vector_policy, &vp_dev->admin_vq.i=
nfo);
>>>>>         if (IS_ERR(vq)) {
>>>>>                 err =3D PTR_ERR(vq);
>>>>>                 goto error_find;
>>>>>         }
>>>>>
>>>>>         return 0;
>>>>>
>>>>> error_find:
>>>>>         vp_del_vqs(vdev);
>>>>>         return err;
>>>>> }
>>>>>
>>>>>
>>>>> And=20
>>>>>
>>>>> static void del_vq(struct virtio_pci_vq_info *info)
>>>>> {
>>>>>         struct virtqueue *vq =3D info->vq;
>>>>>         struct virtio_pci_device *vp_dev =3D to_vp_device(vq->vdev)=
;
>>>>>         struct virtio_pci_modern_device *mdev =3D &vp_dev->mdev;
>>>>>
>>>>>         if (vp_dev->msix_enabled)
>>>>>                 vp_modern_queue_vector(mdev, vq->index,
>>>>>                                        VIRTIO_MSI_NO_VECTOR);
>>>>>
>>>>>         if (!mdev->notify_base)
>>>>>                 pci_iounmap(mdev->pci_dev, (void __force __iomem *)=
vq->priv);
>>>>>
>>>>>         vring_del_virtqueue(vq);
>>>>> }
>>>>>
>>>>>
>>>>> and this happens after feature negotiation.
>>>>>
>>>>> It's before device_ready, however.
>>>>
>>>> Are there drivers that will change virtqueue =3D> MSI-X vector mappi=
ngs
>>>> after DRIVER_OK without an intervening reset?  Cloud Hypervisor
>>>> supports this for devices it implements internally, but it ignores
>>>> such changes for vhost-user devices.  Is this going to cause problem=
s
>>>> in practice?
>>>
>>>
>>> Also yes.
>>>
>>> For example, dpdk uses this during cleanup to block interrupts:
>>> drivers/net/virtio/virtio_ethdev.c
>>>
>>>
>>> int
>>> virtio_dev_close(struct rte_eth_dev *dev)
>>> {      =20
>>>         struct virtio_hw *hw =3D dev->data->dev_private;
>>>         struct rte_eth_intr_conf *intr_conf =3D &dev->data->dev_conf.=
intr_conf;
>>>                                             =20
>>>         PMD_INIT_LOG(DEBUG, "virtio_dev_close");
>>>         if (rte_eal_process_type() !=3D RTE_PROC_PRIMARY)
>>>                 return 0;
>>>
>>>         if (!hw->opened)
>>>                 return 0;
>>>         hw->opened =3D 0;
>>>
>>>         /* reset the NIC */
>>>         if (dev->data->dev_flags & RTE_ETH_DEV_INTR_LSC)
>>>                 VIRTIO_OPS(hw)->set_config_irq(hw, VIRTIO_MSI_NO_VECT=
OR);
>>>         if (intr_conf->rxq)
>>>                 virtio_queues_unbind_intr(dev);
>>>
>>>         if (intr_conf->lsc || intr_conf->rxq) {
>>>                 virtio_intr_disable(dev);
>>>                 rte_intr_efd_disable(dev->intr_handle);
>>>                 rte_intr_vec_list_free(dev->intr_handle);
>>>         }
>>>
>>>         virtio_reset(hw);
>>>         virtio_dev_free_mbufs(dev);
>>>         virtio_free_queues(hw);
>>>         virtio_free_rss(hw);
>>>
>>>         return VIRTIO_OPS(hw)->dev_close(hw);
>>> }
>>
>> What would happen if DPDK received a spurious MSI-X interrupt during
>> this time?
>=20
> Could be a UAF?

Indeed it could, provided that DPDK is actually able to get the interrupt=
=2E

>> I know that this is non-compliant with the virtio specification.
>> However, a problem that will trigger in practice, or which can be
>> used for an exploit, is far more severe (and thus far more important
>> to fix) than one that does not have practical consequences.
>> --=20
>> Sincerely,
>> Demi Marie Obenour (she/her/hers)
>=20
>=20
>=20
> You will have to read the code, and lots of old versions of it, to
> check.

Makes sense.

Right now, I'm working a spec for a new device (vhost-guest, formally
virtio-vhost-user).  It's a vhost-user server, so it is a virtio
device used by one guest VM (backend) to implement a virtio device
for use by another guest VM (frontend).  Yes, it's confusing!

The spec I am using as a basis is
<https://stefanha.github.io/virtio/vhost-user-slave.html>.  Both its
terminology and the spec itself are outdated and I'm going to be
heavily changing it before submission.  The current (unpublished)
version states that a vhost-guest device has 4 virtqueues in two pairs.
One pair is for requests from frontend to backend and responses
from backend to frontend.  The other is for requests from backend
to frontend and responses from frontend to backend.  However, the
device that the driver is implementing *also* has its own virtqueues,
and those need extra notifications.

The spec I am using as reference states that these notifications are
treated similar to existing virtqueue notifications.  In particular,
the MSI-X vector associated with them can be changed at will.
How important is it to support this in the version of the spec
I submit?  How important is it to allow the same MSI-X vector to be
used for multiple notifications?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------hhMEpAMT0RHoM4kIxeJkvgPu
Content-Type: application/pgp-keys; name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49y
B+l2nipdaq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYf
bWpr/si88QKgyGSVZ7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/
UorR+FaSuVwT7rqzGrTlscnTDlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7M
MPCJwI8JpPlBedRpe9tfVyfu3euTPLPxwcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9H
zx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR6h3nBc3eyuZ+q62HS1pJ5EvU
T1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl5FMWo8TCniHynNXs
BtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2Bkg1b//r
6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nS
m9BBff0Nm0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQAB
zTxEZW1pIE9iZW5vdXIgKElUTCBFbWFpbCBLZXkpIDxhdGhlbmFAaW52aXNpYmxl
dGhpbmdzbGFiLmNvbT7CwY4EEwEIADgWIQR2h02fEza6IlkHHHGyiLVf/5wiwQUC
X6YJvQIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCyiLVf/5wiwWRhD/0Y
R+YYC5Kduv/2LBgQJIygMsFiRHbR4+tWXuTFqgrxxFSlMktZ6gQrQCWe38WnOXkB
oY6n/5lSJdfnuGd2UagZ/9dkaGMUkqt+5WshLFly4BnP7pSsWReKgMP7etRTwn3S
zk1OwFx2lzY1EnnconPLfPBc6rWG2moA6l0WX+3WNR1B1ndqpl2hPSjT2jUCBWDV
rGOUSX7r5f1WgtBeNYnEXPBCUUM51pFGESmfHIXQrqFDA7nBNiIVFDJTmQzuEqIy
Jl67pKNgooij5mKzRhFKHfjLRAH4mmWZlB9UjDStAfFBAoDFHwd1HL5VQCNQdqEc
/9lZDApqWuCPadZN+pGouqLysesIYsNxUhJ7dtWOWHl0vs7/3qkWmWun/2uOJMQh
ra2u8nA9g91FbOobWqjrDd6x3ZJoGQf4zLqjmn/P514gb697788e573WN/MpQ5XI
Fl7aM2d6/GJiq6LC9T2gSUW4rbPBiqOCeiUx7Kd/sVm41p9TOA7fEG4bYddCfDsN
xaQJH6VRK3NOuBUGeL+iQEVF5Xs6Yp+U+jwvv2M5Lel3EqAYo5xXTx4ls0xaxDCu
fudcAh8CMMqx3fguSb7Mi31WlnZpk0fDuWQVNKyDP7lYpwc4nCCGNKCj622ZSocH
AcQmX28L8pJdLYacv9pU3jPy4fHcQYvmTavTqowGnM08RGVtaSBNYXJpZSBPYmVu
b3VyIChsb3ZlciBvZiBjb2RpbmcpIDxkZW1pb2Jlbm91ckBnbWFpbC5jb20+wsF4
BBMBAgAiBQJafgNKAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCyiLVf
/5wiwYa/EACv8a2+MMou9cSCNoZBQaU+fTmyzft9hUE+0d5W2UY1RY3OsjFIzm9R
/4SVccfsqOYLEo+S0vQMIIIqFEq3FCpXXwPzyimotps05VA8U3Bd7yseojFygOgK
sAMOAee2RCaDDOnoJue01dfZMzzHPO/TVdp3OvnpWipfv5G1Xg96rwbhMLE3tg6N
xwAHa31Bv4/Xq8CJOoIWvx6fcmZQpz01/lSvsYn0KrfEbTKkuUf0vM9JrCTCP2oz
VNN5BYzqaq2M4r+jmSyeXLim922VOWqGkUEQ85BSEemqrRS06IU6NtEMsF8EWt/b
hWjk/9GDKTcnpdJHTrMxTspExBiNrvpI2t+YPU5B/dJJAUxvmhFrbSIbdB8umBZs
I3AMYrEmpAbh5x7jEjoskUC7uN3o9vpg1oCLS2ePDLtAtyBtbHnkA4xGD7ar8mem
xpH9lY/i+sC6CyyIUWcUDnnagKyJP0m9ks0GLsTeOCA0bft2XA6rD6aaCnMUsndT
ctrab42CV5XypjmC4U1rPJ8JQJUh1/3P48/8sMH+3krxpJ06KNWNFaUbaMTGiltZ
7x9DngklSYrX0T+2G4kVXNmjaljwkoLahwLla2gUWwBSyofXdqyhQdwZsp01KXNQ
UCyT/Pg+aDcm/E7OMV3d4lf7g/CSxiX2GSEe6BlhSz+Lmd7ZJ3g32M1ARGVtaSBN
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
EtJuZYM5blWncBOJCoWMnBEcTEo/viU3GgcVRw=3D=3D
=3Dx94R
-----END PGP PUBLIC KEY BLOCK-----

--------------hhMEpAMT0RHoM4kIxeJkvgPu--

--------------O6LwvM4mkVBp3pJBFe6K07pA--

--------------J0Ffgr6i3k6o4ZK0nGxnYvU1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmnS4ikACgkQszaHOrMp
8lOURQ//X0fcfU6cntOsWmkLy90fAWKY7q8dZ9ET5vcV8iUCt8tEmoJdS1bjDyQ6
pCtL2tZ+aeVJCYlbtn9LWH1LgEQlVKA9rhzZKrPf/3jdo+2ahE+5BcY5Ap4bA+v7
PWoiuOzVYzFXTNKlPfWgOclut3h+0DU0USnXAjj9Jjk/tKZ4e2KmxiFUcOrly48n
bz2AnTnn7n4IKnrhyb5CCj+5QjUmjXiyqlKe3alo4uQHBNf/N6AKaVqJ3hf7Vmki
mFyB2u8Zeqp/kH6zWug+fP9x8H4Ch9bbyjGhnAf/tXYVzywRVVvcRJlNCA+7zZWV
gAulQXoTkhjCHRNTBUiY9Ok0Ux/9I3TvbSSz4P1z30wwbZ+T68X8s/jkQRHlGyts
ikAmh12aKykj2xPPD51kRj4LHHTukX1fu+vsB94/PBYh5gJ0nTi0g6LhpjVGzwxE
6XC6CXX4AN5qpXLDkR5PrW01+txDv9qUCg+FTwLM2qXJMSPb7mqXSTWOa7rIbHXg
kdlAoL5kvq4IwJKRHJbIE8QOt7Y6BaPW2LUSNIFNgpZQQ3mZML+oauI6zZLFPT52
cvXMarp1MonTmL4iDz/c1xRCVRcIt8jKV/9PAM0esgSouHjwWwCZr+NtYSqTvyUH
Z4EFRuqI1MQZxEZs2kFV4eDed1VVhe7n3h8QxcLtuRR/AUz4+XA=
=KKLI
-----END PGP SIGNATURE-----

--------------J0Ffgr6i3k6o4ZK0nGxnYvU1--
