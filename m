Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2043.outbound.protection.outlook.com [40.107.96.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFA453E30;
	Wed, 15 May 2024 10:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715768091; cv=fail; b=Uz3lQZ9e04WWJpdcZX9O360lxFqzH/KM35RxSjDvtHE7/yC3PPcU7ua/eCBqlKYDz2ZfTenSJEoxEMeqKzYRnrxhe4QZkLQ69uRiKOjxWZlUQn9hBwOcOrykn44TCjfTKsK1+sLEyYHfgRiGXcBXnauDZ5NQxsUB9IP/uVmSxHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715768091; c=relaxed/simple;
	bh=YnrUljEQt5qcI/BOv7N2nPpNlwxrK6uDoKSWIYZ7L1c=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iO/Oe2gn7Pk36mP8mY700Rxnxgftmh6KZ3tNM+ZEfbd3n4pRm1jEW1DQcShx00ZUjGlzQKinacHcI3/cFxhQUCGFPW/11AbGldTyWXiFLno21+B06tl6exK6Tu8ff5lEBDGrQG0AO/B2EIt6Z2rPxd4eYuVMXXZa9OzYLD+DUbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GYgUK1B9; arc=fail smtp.client-ip=40.107.96.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GYgUK1B9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qqkpjx2O5m2XeSpZNEQkJd2sm9uH+pL/KNRYSFolpCuOHZDs3gozs38qJeVWQHSPchDfi7JupPAVOJoAObkk6NjU71AxKo9Dkm5bZcaF/Z4w54h2Pkffr6fK6iQy93UReBo9wewEbduudQgPxa/H64qG/wXuQYVejej61eUMFtEzSJcow+Iovz8YibpyGTMaJBdZbf5URVcAgzf7kqoQaaVlXQrFsfuSZMkaNTg1+sjqEmIWYqzWI166WQKNTo4BCPdxEvKak9z6eaNH1HQ8FjSngzAfuvuRU43jA7ez8GcZG2VvysXt/8O306ASioALRcreMxvcayVlRyrLPwLd5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJi7ego8XVmbF1++QjI1OM993RigbK2RdItw/+KPAGc=;
 b=CD9sXnZ+a+d09OTIOo6vra5UFSDunIGk3rYZZKGUIa3b9MvDsidgFJdjpr6z2vsZP14kjWa4Hi5KaRpEiP7gvk8KoWrTgpD1MayohJOMtcmwYIpH3UOf5Ek9esvQ7TlkiHhogmKdPPmtXtjjMJF4x+48ektvrDAJTdR3NpV72K7g3Xd0Pk5+PPDU6xNs6I1ALbdvsXBCVMvcdG86/Un6BxK3XZrbOd30HbFFOGPnnh8eEXtPKyxJEN716dzblLph548Tg5MEEhn+un1BwVgGaQ9bX7jIZsOrFpHjRiPbQeQXCljMy56GdLECH4rsQRuCwKkCKm2PPtyG0X8zLNCc6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJi7ego8XVmbF1++QjI1OM993RigbK2RdItw/+KPAGc=;
 b=GYgUK1B9jM8jf/44jmp+lTATkAhqGwVZoliVa+cRK3+KHsCCx4LH0EjxFUegT61ahl5rhrGRPxzr3JBUjsOn7Qs+t6uBPjd/7/qpxXqa7yErVYEGlEnAgPKgb+rABtUdlDZxy6Pb9jtjEWSok7Js8ROizJc18/WCM00SMK5SlhciT8x+VOj+W+En4RjaG4eJk4Ownw2qeZklZcU7gn0i+570Zdvfoj9U3lnq+7TK49Ao3C4GyFEGflKxQFMiaEnnriUr/YLn6PuBiBa6cZWPnsk2kmdvK951JfDuhyeIV46P8hFkunSS7TkbhLSDR7yhmFkJngNMt5LMMEitbv0U/g==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by SA1PR12MB6822.namprd12.prod.outlook.com (2603:10b6:806:25d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 10:14:46 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7587.026; Wed, 15 May 2024
 10:14:46 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "virtio-dev@lists.linux.dev"
	<virtio-dev@lists.linux.dev>
Subject: RE: [PATCH v3] README.md: update mailing list info
Thread-Topic: [PATCH v3] README.md: update mailing list info
Thread-Index: AQHapq3cqOwFBT2zLkCXuuWIgQjcxrGYE1qA
Date: Wed, 15 May 2024 10:14:46 +0000
Message-ID:
 <PH0PR12MB54818B506EFE9E4ED61B4294DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <8f5db33c96d685fcebca3579b05d09b64dd720d9.1715766697.git.mst@redhat.com>
In-Reply-To:
 <8f5db33c96d685fcebca3579b05d09b64dd720d9.1715766697.git.mst@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB6822:EE_
x-ms-office365-filtering-correlation-id: b5e5cf0c-862b-410a-97db-08dc74c7d8ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ek5r8tFQWv6+fn0w+T3KaxlIXjN1L8Y5siYE6mBFj0rjzoTHyYq7aex5/6ZQ?=
 =?us-ascii?Q?+l6sNmOi/G+ghhnjcnOVpD7Xxzh+D8yq+RziFJ+KYgwFYjgvkHJlBsbzW8uA?=
 =?us-ascii?Q?a2jWlEnS09qLVgGMtZoRLyKGYoBfMaRegrhPRxdZGNW4/h+BKkKSSHuIVbnr?=
 =?us-ascii?Q?QS7/YnZ23TIpNMkOCQm1USuzT+3kMV56B2sE+HoqKJx+bEGoYeqQSgLMuK4l?=
 =?us-ascii?Q?851MaVjmR1dFg7uGuRYaVjgP3PF0HWUgj2B0r9pnNgGymz5SE+xdan6IRagt?=
 =?us-ascii?Q?j0FwJiaJaDzYIYOyzSQgFr3//c4KAj1GkHpCT3KyTUUHg3FYHlMtVJjmpJOO?=
 =?us-ascii?Q?tmxNIxhcXSZfexvalOll7Td9FHKsAbDkM8MrEdJnAD950MwEzqIqhiAl8p9O?=
 =?us-ascii?Q?c7O/qXU1BGZznb3M38q+r2Zdz7MEauAbsM8kGInIm8TaXLTQ0JmvQtxmkUEt?=
 =?us-ascii?Q?hs8QW6qyMb42vSLOIQPkAOPCDJV4czBeNEJNWgNCPTRLfTrVUOys5Q3d7zvh?=
 =?us-ascii?Q?D8elRc8rxdNspoRe6TO9w6lWf6C5mKPWbBREWbKokSz3ePYYo+9PIxATkOxS?=
 =?us-ascii?Q?E5LMKAOLw+jJ/gV3cYTKxal0vLl8NuTABXKN/5h0+2Zq0zzBON6IZsXf16AE?=
 =?us-ascii?Q?qzBzU1Dj6TKLAh4gkVcscHd/luu5POXeFQ2nRH+zQm65CeFP1VvlBMYPDUyv?=
 =?us-ascii?Q?nED8H1DWpNONJuL/UNmwJy0LEwDGfzhKmJCbhIdy1o4MUDRC0y9VGSxWYlLO?=
 =?us-ascii?Q?ItgPQqcMr7lNQianoOyiAaCNfd4QjA6xGq11I6+KVIEqt0Yc8rq13aJWjOZe?=
 =?us-ascii?Q?T1GO++gw+8XEH9Yx+bYLa5cDNolGyTeBjjvvGmq+5Pai4zIhR5uqY/sPkEo7?=
 =?us-ascii?Q?u0HioduCf+G05q1TS3htSAh82m6Jkngq8e6PsZAux5RVO6Q85NfPlnXsEtt8?=
 =?us-ascii?Q?WziG3jCZceTuvuH/qwIoCHeqhZuZBnlxM+LmAKQqsZljUcRmGQLxs8zun7jb?=
 =?us-ascii?Q?plwGuQwgSgHgDbRSjdiLH1rIQtkoagroT8FNwVaS7FOeSV/U/Tafb2vVbXLy?=
 =?us-ascii?Q?cyhqiTeg9C6VOdtoVRZ12zJXR31KIm1SOP7xJ4Z8px9YQcOwwmji3I+rDAAy?=
 =?us-ascii?Q?nkIsOndAkMRijTYlIqGqJEO1xio8M6JCBrz7zbt+wc8KRMyzIcGPf8jRbgxJ?=
 =?us-ascii?Q?wyC/WcbqoNhs/4GWfzfbzhuLs7pMBCHhhTQfd5V4LHTpGr1RZalW/3kE2Tvl?=
 =?us-ascii?Q?ZUrAWM+nTFW7XE6UiwKOwHxlaa0pLxTYxQHHGawhq/5onQyLNiHKS7YEf+Mn?=
 =?us-ascii?Q?FkQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?M431uxBjuTxT4vzwsLKgM1zaUMp8vBMOjm+P5z2Xzf9lksbySN6aqcZdAdJ6?=
 =?us-ascii?Q?/JVdZz5XAZvgWHhE/EVcOLqxJM6vNeJVei7kqUtmJo/U4B/UimXA112X4JbG?=
 =?us-ascii?Q?P8+WyihCinGzHjR0bK//jNINBvZOTftTAm+0SuY3FJ8iw/zisqB4WySzVJwZ?=
 =?us-ascii?Q?4oXHwoJSIMxeofIRtG/kwazMESLMDqk1RwSOCzWznQzvfQov0Ym1DSLYagjQ?=
 =?us-ascii?Q?/Z5eb7eXZctByJkVXNZGlc/nhnL3ViYesAZZCdZ4Cy97r8oWHRBDvbUbu1+f?=
 =?us-ascii?Q?FErcGOA8KyGw1zH6P3BziN38eLuSeSoWhJz2dsh7Dl06Mj7h/vjdlhts41lX?=
 =?us-ascii?Q?Y13K5R61mfYQGkLlh2BXeRzA9xQs0aieGqaXr8E2rbU7OFY8dNQhzItWXDqe?=
 =?us-ascii?Q?vPnCdIp9+oXycIOs71v/yGAnKxJbGyrKjbvWaPP5375R8vTkMfCCBBS8tbTn?=
 =?us-ascii?Q?Qzw9wtHhd5vj9Kh1HKdo49sfX4ZS83mVqT3zXVzgQdavxQaT98jtei1c7M3j?=
 =?us-ascii?Q?X7rILT8pwKrYRvAJtTxkrq7iHGQhVz0oY7iJb7TDWmCo21NrlF5IS3ZQ9Q4Z?=
 =?us-ascii?Q?EkSd+OnVV24WuHKSYtYMoe5uzS0ufu69ryUEBJ6HRegEo2CsikRWsTUd/G+s?=
 =?us-ascii?Q?EYjB1qjtblmpTfGjHPzYT13FRcTdjOKIyBWndNYf5u1xAen6WlCeBfKle5Zp?=
 =?us-ascii?Q?yowl72CxOpC9emEmtgDYg3eW23BGxFHi3CoF7GmK/P25v6fMkYHmy+NxMDKm?=
 =?us-ascii?Q?bIEc7xjVnK9yvKVoNz8+FzRp96evtj1Y45VqGM6zf925wcHeckB0DO9qrXAv?=
 =?us-ascii?Q?nOhqEMT9OAEHHYKxypOx9w3PxbyvNmT/7JEF3KZwh6b2TQ8POM4r8kAArucT?=
 =?us-ascii?Q?oYnl9hPrnHxB/nynnOYCv56JcXUY/ykfL+CWNyRcGXZSlOdgbCSun43qh/0M?=
 =?us-ascii?Q?S/J/vBmta2QCovPhXIK7LVFeD0HcW8AMDvqQY4P7VdpmmXy1ba+0ObqEcwVA?=
 =?us-ascii?Q?1AscWJ28Z9b5wB3TehzSJh9nrBlK4urAYgd2oace46KAf3mJKllo9OKiIXCi?=
 =?us-ascii?Q?UHf+a8G8vvEvXXnyOJBtluadMCdVuAH3DzWKfyMjrrPRw3Doll6EIW3WgF93?=
 =?us-ascii?Q?ZfHvE+I/Cl+n5SP1hC7hd0YL91N2UfeOwX3N5MaOGVMRQ/XxA3tHWQ5XcvRw?=
 =?us-ascii?Q?NsLXmQY3IBRammRXufSQ4PJszgiHCaF9ko24cSnpgq/FT1KUJruGPJJ3efGN?=
 =?us-ascii?Q?kJhA+t1f0NkTTMqI5O+KPoVmYysl8T5HuneH3fCNwrl+2DlGjqcpM1JYDDrK?=
 =?us-ascii?Q?xBucBa6LH5NBy2cr3QIOEsNqYhxIJxDs35UWWLcdvxPi7WpwNUm1K6dwqRGD?=
 =?us-ascii?Q?D3j+XGezrnQ5C2jEqV6jNeYu7fPyLy1WEhsHVXdvX9yGmC37aOoZhVAbVogl?=
 =?us-ascii?Q?EdbzaMAt/6HCSQASPNPpaXoFJEWBMOkgOcjsnqYho4lnmyZBJ+/lKA7Ou1dv?=
 =?us-ascii?Q?WIAba0QZx5jYkfWTytCVaNdA5spQLmidkfMNR5Bwaz0ovxouOXtJQII84ahh?=
 =?us-ascii?Q?SIWqPUjUd27NRIkSBBk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e5cf0c-862b-410a-97db-08dc74c7d8ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 10:14:46.2144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P/AR7BxPU+xWwggkHowdIIzZLSwcm97Od3nPpN8QwP6PvqKmWYfa+WTNE7FgXPDzTfMy0HKKc44MkvkupuVwVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6822


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, May 15, 2024 3:23 PM
>=20
> As approved by the TC, we are moving to a less formal way of discussing t=
he
> specification, on the mailing lists provided by the Linux Foundation:
>=20
> https://groups.oasis-open.org/higherlogic/ws/public/ballot?id=3D3820
>=20
> Update README.md, CONTRIBUTING.md and newdevice.tex accordingly.
>=20
> Use this opportunity to explain when and how to use each mailing list.
>=20
> Oh yes, and device numbers are reserved through virtio-comment not
> through virtio-dev. Correct that.
>=20
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>=20
> changes from v3:
> 	update CONTRIBUTING.md and newdevice.tex changes from v2:
> 	Use this opportunity to explain when and how to use each mailing list.
>=20
>  CONTRIBUTING.md |  2 +-
>  README.md       | 80 ++++++++++++++++++++++++++++++++++++++++++-
> ------
>  newdevice.tex   |  3 +-
>  3 files changed, 72 insertions(+), 13 deletions(-)
>=20
> diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md index
> 1330a98..ee7318e 100644
> --- a/CONTRIBUTING.md
> +++ b/CONTRIBUTING.md
> @@ -10,7 +10,7 @@ in the TC's technical activity is invited to <a
> href=3D"https://www.oasis-open.org  (Member, Voting Member, Persistent
> Non-Voting Member; Chair, Secretary...)</p>
>=20
>  <p>Persons who are not TC members are invited to open issues and provide
> comments using this repository's <a href=3D"https://github.com/oasis-
> tcs/virtio-spec/issues/new">GitHub Issues</a> tracking facility or using =
the -
> TC's <a href=3D"https://www.oasis-
> open.org/committees/comments/index.php?wg_abbrev=3Dvirtio">comment
> list</a>.  All such content created in GitHub Issues and/or posted to the=
 TC's <a
> href=3D"https://lists.oasis-open.org/archives/virtio-comment/">archived
> comment list</a> is governed by the terms of the <a
> href=3D"https://www.oasis-open.org/policies-guidelines/ipr#appendixa">OAS=
IS
> Feedback License</a>.</p>
> +TC's <a href=3D"mailto:virtio-comment+subscribe@lists.linux.dev">comment
> +list</a>.  All such content created in GitHub Issues and/or posted to
> +the TC's <a href=3D"https://lore.kernel.org/virtio-comment/">archived
> +comment list</a> is governed by the terms of the <a
> +href=3D"https://www.oasis-open.org/policies-guidelines/ipr#appendixa">OA=
S
> +IS Feedback License</a>.</p>
>=20
>  <p><b>Use of Contributions</b>.  As with all OASIS Technical Committee
> assets (TC <a href=3D"https://wiki.oasis-open.org/">Wiki</a>, TC <a
> href=3D"https://issues.oasis-open.org/secure/Dashboard.jspa">Issues
> Tracker</a>, TC <a href=3D"https://lists.oasis-open.org/archives/">Genera=
l
> Discussion List archives</a>, TC <a href=3D"http://docs.oasis-open.org/">=
OASIS
> Library</a> assets), content placed into this GitHub repository is visibl=
e and
> publicly accessible.  Subject to applicable <a href=3D"https://github.com=
/oasis-
> tcs/virtio-spec/blob/master/LICENSE.md">licensing</a> rules, the reposito=
ry
> content may be re-used freely, including the creation and publication of
> derivative works.</p>
>=20
> diff --git a/README.md b/README.md
> index 2bdf485..c06caf6 100644
> --- a/README.md
> +++ b/README.md
> @@ -76,11 +76,12 @@ font packages.
>  <dd>
>  </dl>
>  <h4>Providing Feedback</h4>
> -Feedback must be provided the <strong>virtio-comment</strong> mailing
> list, -and archived in the mailing list archives.
> -<p>See <A
> -HREF=3D"https://www.oasis-
> open.org/committees/tc_home.php?wg_abbrev=3Dvirtio#feedback">
> -https://www.oasis-
> open.org/committees/tc_home.php?wg_abbrev=3Dvirtio#feedback</A>
> +Informal feedback is accepted through the
> +<strong>virtio-comment</strong> mailing list, and is archived in <A
> HREF=3D"https://lore.kernel.org/virtio-comment/">the mailing list archive=
s</A>.
> +To provide feedback, subscribe by sending mail to
> +<HREF=3D"mailto:virtio-comment+subscribe@lists.linux.dev">virtio-comment=
+
> +subscribe@lists.linux.dev</A>, then after confirming you agree to the
> +IPR sending your feedback to
> +<HREF=3D"mailto:virtio-comment@lists.linux.dev">virtio-
> comment@lists.linux.dev</A>.
>  <p>Note that only plain text part of the message is archived, and all
> attachments are stripped. Accordingly, messages sent to the  mailing list
> should use text/plain encoding and not @@ -106,8 +107,38 @@ Signed-off-
> by: Name &lt;email&gt;<br>  git format-patch -o proposal1/ HEAD~1..<br>  =
...
> generates a new directory proposal1/ and a file starting with 0001- ...<b=
r>
> <p> -git send-email --to=3Dvirtio-comment@lists.oasis-open.org
> proposal1/0001-*
> +git send-email --to=3Dvirtio-comment@lists.linux.dev proposal1/0001-*
>  </code>
> +
> +<dl>
> +<dt>When to use the virtio-comment mailing list:</dt> <dd>
> +  questions and change proposals for the Virtio specification,
> +  including the specification of basic functionality, transports and
> +  devices.
> +</dd>
> +
> +<dt>When <em>not</em> to use the virtio-comment mailing list:</dt> <dd>
> +  questions and change proposals for Virtio drivers and devices
> +  implementing the specification.
> +  (please use the <A HREF=3D"mailto:virtio-dev@lists.linux.dev"> virtio-=
dev
> mailing list</A> for this).
> +</dd>
> +
> +<dt>To do:</dt>
> +<dd>
> + send email preferably in text format (best for archiving).
> +</dd>
> +
> +<dt>Not to do:</dt>
> +<dd>
> +<ul>
> +<li> copy both virtio-dev and virtio-comment mailing lists (instead,
> +pick one); <li> send full copies of the virtio spec (in any format).
> +</ul>
> +</dd>
> +
> +</dl>
>  <h4>Note for TC Members</h4>
>  <p>TC Members should review TC specific  process rules under "Further
> Description of this Repository"
> @@ -116,16 +147,43 @@ HREF=3D"https://github.com/oasis-tcs/virtio-
> admin">https://github.com/oasis-tcs/vi
>=20
>  </div>
>  <h4>Implementation discussion</h4>
> -Implementation discussion should take place on the <strong>virtio-
> dev</strong> mailing list, -and be archived in the mailing list archives.
> -<p>See <A
> -HREF=3D"https://www.oasis-
> open.org/committees/tc_home.php?wg_abbrev=3Dvirtio#feedback">
> -https://www.oasis-
> open.org/committees/tc_home.php?wg_abbrev=3Dvirtio#feedback</A>
> +Implementation discussion takes place on the
> +<strong>virtio-dev</strong> mailing list, and is archived in <A
> HREF=3D"https://lore.kernel.org/virtio-dev/">the mailing list archives</A=
>.
> +To participate in the discussion, subscribe by sending mail to
> +<HREF=3D"mailto:virtio-dev+subscribe@lists.linux.dev">
> +virtio-dev+subscribe@lists.linux.dev</A>.
> +After agreeing to the IPR, to participate in the discussion, send mail
> +to <HREF=3D"mailto:virtio-dev@lists.linux.dev">virtio-dev@lists.linux.de=
v</A>.
>  <p>This is the correct list to copy on Linux virtio UAPI change proposal=
s.
>  <p>Note that only the plain text part of the message is archived, and al=
l
> attachments are stripped. Accordingly, messages sent to the  mailing list
> should use text/plain encoding and not  have any attachments.
> +
> +<dl>
> +<dt>When to use the virtio-dev mailing list:</dt> <dd>
> +  questions and change proposals for Virtio drivers and devices
> +  implementing the specification.
> +</dd>
> +
> +<dt>When <em>not</em> to use the virtio-dev mailing list:</dt> <dd>
> +  questions and change proposals for the Virtio specification,
> +  including the specification of basic functionality, transports and
> +  devices (please use the <A HREF=3D"mailto:virtio-comment@lists.linux.d=
ev">
> virtio-comment mailing list</A> for this).
> +</dd>
> +<dt>To do:</dt>
> +<dd>
> + send email preferably in text format (best for archiving).
> +</dd>
> +
> +<dt>Not to do:</dt>
> +<dd>
> +copy both virtio-dev and virtio-comment mailing lists (instead, pick one=
).
> +</dd>
> +</dl>
> +
>  <h4>Use of github issues</h4>
>  Note: according to the virtio TC rules, all official TC communication  i=
s taking
> place on one of the TC mailing lists.
> diff --git a/newdevice.tex b/newdevice.tex index 28e1c7b..ed0124b 100644
> --- a/newdevice.tex
> +++ b/newdevice.tex
> @@ -29,7 +29,8 @@ \section{What Device Configuration Space
> Layout?}\label{sec:Creating New Device  \section{What Device
> Number?}\label{sec:Creating New Device Types / What Device Number?}
>=20
>  Device numbers can be reserved by the OASIS committee: email -virtio-
> dev@lists.oasis-open.org to secure a unique one.
> +virtio-comment@lists.linux.dev (after subscribing through
> +virtio-comment+subscribe@lists.linux.dev) to secure a unique one.
>=20
>  Meanwhile for experimental drivers, use 65535 and work backwards.
>=20
> --
> MST
>=20
Reviewed-by: Parav Pandit <parav@nvidia.com>

I see that patches are posted on virtio-comment for balloon device.
Should community wait for this patch to be merged or ballot 3820 is good en=
ough to consider this new mailing list active?
