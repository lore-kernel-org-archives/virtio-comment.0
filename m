Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB0A233735
	for <virtio-comment@lists.linux.dev>; Wed,  2 Apr 2025 09:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743584650; cv=fail; b=cSyGK/6/0UEsRB+b3Tk1BTIUKxyMRupofz5sdXmXNUO+O+CVUgWW3o97r0x8t0O6XqEdbKhT92Blf6d2Tz4/Mq65PLSzbsdZoND2QETExjdwWJ94w0VPgRV3S1nbCXdmzpJHPK86TDsRRFOy1wVfQF5qTbT1YXb8xYqtsp1dZSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743584650; c=relaxed/simple;
	bh=is2K54hWJO3HBgBYoDlWEad4EaWuTlHnykgxdYrHvaU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q9F35wiVGla5Y5rHJZrVYUxjDbPRdH4JRwFDHXX0nE+JjZTew0n0wmPprfX7eLsaxpEeFTDTFvK8PTLLHMqyHv8+dx7gUXV49IpIpCiMFi3k67aPhGcav1fVOPvV6eJSNJddHGE4Pp93rLTUsBTkW7OmpVkri763aduqx//rBNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FvyP79SX; arc=fail smtp.client-ip=40.107.92.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FvyP79SX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAUhLAJIwWAmme/RxW5mEAq3Mm/3zbDQDWUzy83zynKUJr7QWJs4gwJafWUHncriowZ9OqMcaVUavJxSuJJJHS2u3h1vBDsNPqSiCKDZ2uDp34Buubj/bvd0WDRxX/ayDH092fdAnxre/z0piUQlZb7wVWKJVN0MA6RReDJwe8h/1TcsnRtDM8njPHD8S+yCXMzN61lPukzxWeUQRbHzp5j/WhsKaTbYUg7prSqrR5nTIm+J7NZS1SU+T2B72yqT2+AFJrmhTaOyKxuq4+/28I3+uOvRheTDTzBTYUVn3rYeDY3JpUpo1n5CUIj/4DjPFgjeaZcFwf6wpR8EQgLdnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulJ772zcGxqhNI8biBShDW9ZuzdtnAFCXjM8VafC1Wo=;
 b=trrP3mZ1DklCHD45hH2atUu+jdT2IJSId+GH2uVtm8QNt7+7M5b3HD/zwC0+++nTneeW9v6vRMn+PSCqx2RpGFUxgOealMmzsYmqyAT/Pkx7ek5vjD/gqHjf8776geYCrXacUOEx6FiGhgGOquv1xpDICzh+jNd3l+LGdx3iJtVy6Szi7Ze9geWOPp05mq2qEtXRftvxArR6rHM3uKcSuxN7jUvXt99dEb+a0biNuEsYTw/vya0yGgDZrmUvqgHFOk9k2PrTcZz9gbcfNIzXZDLaE44rwwpVVFk/B5Mh813eLBbcMksrk6TN6mxx8dXdOxwxtzz7+cPS6zHcSfCoIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulJ772zcGxqhNI8biBShDW9ZuzdtnAFCXjM8VafC1Wo=;
 b=FvyP79SXwhrWhu9Tg4ozJqwlP/eZl5FOCX0a4DnEuKCN+wsvli1aHsg8eACh2eV62hWy2kpZT3JNcev6pLiIjPf65R2YlG1NkBegIDSMl9qRN2ki6Vjigm/wTwDUXSniwrcAUT2bg1aKJqusI8VeuV70dTcZ8QhGPMb/0OJW0rH7R3mr2TBSEgbuXu5DLmAt7V3MTAP0blzIlFwgzn6uYrWzKU6sX4Cs1QOcUIaRDWgXs285nPoy3MD78NLH517a+1QhnmLM2zDqPdXk/YEMmNASUL6GZ/Uy4jc2TueWGTUIRy6ywd9HopB/uyfKoFvRn4c+8xlXXjYncMvGpLuPgw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS7PR12MB5982.namprd12.prod.outlook.com (2603:10b6:8:7d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 09:04:05 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 09:04:04 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Sergio Lopez Pascual <slp@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "dmitry.osipenko@collabora.com"
	<dmitry.osipenko@collabora.com>
Subject: RE: [PATCH v2 1/3] shared-mem: introduce page alignment restrictions
Thread-Topic: [PATCH v2 1/3] shared-mem: introduce page alignment restrictions
Thread-Index:
 AQHbolXliN53xUoF0UGmhntfFfdrcrONa8OAgAAG04CAARWygIAAARpggAAENYCAAABZ4IAADDCAgAF0o+A=
Date: Wed, 2 Apr 2025 09:04:04 +0000
Message-ID:
 <CY8PR12MB7195C69DE325358ED5AE0376DCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250331150548.50595-1-slp@redhat.com>
 <20250331150548.50595-2-slp@redhat.com>
 <20250331121538-mutt-send-email-mst@kernel.org>
 <CAAiTLFXdYDSgZnYAgGC-FpMcyOnqBZpiTrHOk=4x_jFiRzkcbg@mail.gmail.com>
 <20250401050828-mutt-send-email-mst@kernel.org>
 <CY8PR12MB7195A0BA1C5D6946196D65DCDCAC2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <CAAiTLFX_RmzJfuLaJ+95S+k6Y20o62Hzyxwe+HwHRzkob=NCkA@mail.gmail.com>
 <CY8PR12MB7195B8C5D33157328BA9DA34DCAC2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20250401061541-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250401061541-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS7PR12MB5982:EE_
x-ms-office365-filtering-correlation-id: 58bad0ae-7f96-422a-912f-08dd71c5519c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?0e9SD4vOe5j+DK5juzSu6QmEsCa33ozmLdkXYiDfeCf8vmM8fKuv7gaKX/0b?=
 =?us-ascii?Q?I9iHlFFOsKpeGCFdUlGTBN83GlVMEA+1mn0BCunxPhyEzoj0bX38tSq9tFaU?=
 =?us-ascii?Q?mw8qad4ViBZIoVx33t77LTw4VgdUbqVya3dY9Kv4iLDEICpwB9Mnk7rxD/Ru?=
 =?us-ascii?Q?heK6Zl1yrRMcAGRtspJdpbYqFEG6NcMFtTQnusz1YIEeclby1Z6JSJVa+NoY?=
 =?us-ascii?Q?Ff03+NVE7J6gFC1/iD2GsgDxxqFXAEIOPaBa8K3flBQqSazKy0oPrBZESAV2?=
 =?us-ascii?Q?PnWy/neRUSqdou0EJw/KW4gk84jm9crQj895qWzuG3TRNOxjzezVRD86IKjG?=
 =?us-ascii?Q?SZAimUjHDz+GqJybp9nbq7QN5WnOinVw5f4FYIoBOUeDAGAtItIFczJjmCmu?=
 =?us-ascii?Q?oN1kK8OimL2j36uvMKdtA3KurSkhu3Vop9IfAPE5kPj+CUN30rv/tAVFxS1C?=
 =?us-ascii?Q?TKHO6rspbL7kEmyGQDQCMMMS5WjQukc5lcXsUQ9K3mPXD5ZqgINgfchaOxyw?=
 =?us-ascii?Q?CqFseYB91gfQe0Og5zotV3e+OP6qd5NoEs4v+GwpAm00mshaVuCWan23ob97?=
 =?us-ascii?Q?Jsn9PgeWKHH/vl9ahqu30wKdzcoZ7bzRuNrHvM1+BwStjHYYULyKaD0sOFUU?=
 =?us-ascii?Q?oeyD9XRlbWbMMxkb2KTIU/LJu6OehyGWWbwgEB7WZaUFTwJhfLIW3eY2ENTi?=
 =?us-ascii?Q?sPeXNMrz9bH6gFGEd5oE+bfk3LGRApTe0TIycGF/biErlgWmgsiKdK/6RVGi?=
 =?us-ascii?Q?NYEV6FJLdRMhtJ9CMlikmOs3ONDoQ/Q6/F7fMSVCgaB1n8ea/Yo7UhZ+/Ebs?=
 =?us-ascii?Q?PCi8Lf5HQ4N9wm0CLRUGAMleLORS0a2h/qV8vJpUcZoDeW4AwAQtTsd4EGRr?=
 =?us-ascii?Q?4IoADRaPW5mQmycZOUR+apE6uOmAW6A96vh5Wykj0XZC9WHw5nxb3z2P6Bli?=
 =?us-ascii?Q?zBRDKIvm+D7sCPfPpO1omzmETagkyO2pSJO/sXOnV4AAaiCaijpb72uYVRnk?=
 =?us-ascii?Q?hzwXqPtmV/eAb7lWZM5j0e57ZwcRYnvBNyYhFHjB3NF+pvCPry4lVtAJ51S+?=
 =?us-ascii?Q?ChvefeYqVFkjnrpk+dBCzo6y+JvgG++b7HA6a62KVWHfFdDAqtveoHQnGH3I?=
 =?us-ascii?Q?bNfESXZmM2eVsWVIo7TkfXZVA6RXpTGNeeUM5mKlpYWFovl3y0dY5uP6ATYe?=
 =?us-ascii?Q?Xav+eyqI2rmJR7+HRQ33xvF+wrnvpc5SfElYfXkWbIaE9KMGU807rynIFrcU?=
 =?us-ascii?Q?ChbQ6n68x1nAyzh21o3rhEes5miQgDw4Z4lJaVjxq2y4/XV1VIgIEprUu0p/?=
 =?us-ascii?Q?c7xaSyblmJW4ZPWjll+kY46Ro1C54koLfPBUJVeUdw70PvLRFhYP/Xi3fSi5?=
 =?us-ascii?Q?o26TAzH3Mh7U8hlQ4jfQbgUFQ8s1VQ/WaBKEXBlAoS1YZwefHmmoCHbtrh1p?=
 =?us-ascii?Q?5zDozevDoq+fxChDnwsJGr/5WwaFet8d?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WPlce03MULMLiQModAXB4RUbGTQek1aDvgM3GSof2xeN6LtJxQIlPq3x+/JC?=
 =?us-ascii?Q?dGa5URASFTHmyCq5jKIQJpObOLg+PHWbygsJKgDB0+p2yF3a41NfVJ9dFf6K?=
 =?us-ascii?Q?YBcsC1y7EdDi9iXt8Yy2cHBpqKUU4eB6XKIUJm6LmUen9Ks3uGO4NiRS8RiF?=
 =?us-ascii?Q?x5JecPNEmieFCtnSkklwDRdMWfQQ5VVaGY76+ANqxL/D4TgxSaACRPZiSpp1?=
 =?us-ascii?Q?0J0OAiOj7wOZnaSFLU/rS+tE9mn9fjq1hF5K1rAmjPL8oPgexzh9s6JdXdKx?=
 =?us-ascii?Q?1uizeJO+XTKj/sRECZ0Yj1pz9+wo76ZF2tjP6E0vy/Vn+zII021d0XyOqg7G?=
 =?us-ascii?Q?8vkziOwE0KEjp1vj2eb2sEzqp+ujfnkLWe0iVtjr5ac0YXdvINVrTB6kBTKl?=
 =?us-ascii?Q?7oBzXiC/KKDR99T+Lef5wlkBZ2OEDwj5Lz2v4w+n6b9kg5AhyYI97B/hrpXB?=
 =?us-ascii?Q?Qo9l0w3T9Y+UEVitqHCXtoyxxr738ww7G2+maUV4kPFXg+u+MjxI87hLjwZ1?=
 =?us-ascii?Q?6U0p8l3c+dUxwj2tsVgwSxO7XiG6HRO6G/cKtSZFX6wEEfKsr2gFN2X9X3xN?=
 =?us-ascii?Q?67MhuDgFbv8XumrGCJ7SmAwhf36bghQzSfOBLNUWRhJVTgQxr1X0ahB6AK81?=
 =?us-ascii?Q?PnfdOQruLlRwf/g/WKJWvhZkRp8UyXf5KZnvFCRk2ViFvXL7qvOmPPrHS2ST?=
 =?us-ascii?Q?h78GCAJg2i4h/r6o9NoNvSwFbvNu7pUKZlokFZHwnKVN/9BDLuWYwzdLFfof?=
 =?us-ascii?Q?SSjSHi0zHCGvfwzcqp5GphdvvJie+1F+82DBiZfws/ElwpdJwqGdG9M40amO?=
 =?us-ascii?Q?93CmK0ut92OBNBu6D9jIO9LfzYo2OhZiIjxVhaT3pIUAbwkb9D/L/Qjgs2yw?=
 =?us-ascii?Q?Ic1FMPmo2Y0wi5QsREibdqJgcUlLckswHePE9sOManFpS4nXufinD5AAng9O?=
 =?us-ascii?Q?cZdXXsVzbbEhEqGAygTPpQeplXrov+pnO0/XKeI0NZLl8xR9eHEhG5tGikYy?=
 =?us-ascii?Q?ZLL52c/ZwjGGMBzOnYP7+pmNVAwR/Vl3+2nKf7YS9OZFK8y2bD53Qf2HpYEW?=
 =?us-ascii?Q?7npPPQFXKktMOaWHg3S25LDOE4RNxBMuwVww7B+LJPHfIAJYAeMSarPuyw5b?=
 =?us-ascii?Q?fx2ph1fiI/kHbz9Mum1JrzP+KxqJJY/8svJWS2SAstaKp8K1cUhqcVFquQ8r?=
 =?us-ascii?Q?Tbhq+eh0uKG9N/UYdRtVqshmOs7iN9KfN1OVc4stimNYBTXb7soNkuya2FnN?=
 =?us-ascii?Q?iXvTmBGoGF+6byOL1DXAtRTt8vzsNQ5G72BA9mvlAkTDCRy2qlU6I7Jxddup?=
 =?us-ascii?Q?9fCCJ8Y9D0e48Wej41W/7hY9pop9jzLrJf7iS8vIHbcqFJzSE4P854R87hnF?=
 =?us-ascii?Q?TpHgZyz4Y82E8InP8txkxtKMZGZrTPliuo7tAY1ix80Fxm8h6j/MMa2+KB6f?=
 =?us-ascii?Q?VvBhohAchuGYgUHUFUra8JwbR9VEl3EG82l9V3mjGGSbUoab2FUapBLWhSR5?=
 =?us-ascii?Q?bIEy3zqaTrKfPy4nGkn7+YPFa5IE6l05RXzNfx9AAeG1woWn7Y7MTDBaVntD?=
 =?us-ascii?Q?T6MQ+RtRt0ae3lvr7Dg0Cqsq2mbGZg47LJIPs5YnlqZp6hJQi3/C/HmaUjoI?=
 =?us-ascii?Q?A8gJms0PgMPyQauXkwR8NvnnZE09Wx61G3yV9+Dd9Qqy?=
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
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58bad0ae-7f96-422a-912f-08dd71c5519c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 09:04:04.7629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xX1aanDgBxG44LMlsOikfZGZF+3Ikg0G6WoSoZbFTNa+QPaUJ5Y/nHFvqpu4tWZb/VyOYjUgflwvjUZZf1lXlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5982


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, April 1, 2025 3:48 PM
>=20
> On Tue, Apr 01, 2025 at 09:37:21AM +0000, Parav Pandit wrote:
> > > From: Sergio Lopez Pascual <slp@redhat.com>
> > > Sent: Tuesday, April 1, 2025 3:04 PM
> > >
> > > Parav Pandit <parav@nvidia.com> writes:
> > >
> > > >> From: Michael S. Tsirkin <mst@redhat.com>
> > > >> Sent: Tuesday, April 1, 2025 2:45 PM
> > > >>
> > > >> On Mon, Mar 31, 2025 at 09:40:37AM -0700, Sergio Lopez Pascual
> wrote:
> > > >> > "Michael S. Tsirkin" <mst@redhat.com> writes:
> > > >> >
> > > >> > > On Mon, Mar 31, 2025 at 11:05:46AM -0400, Sergio Lopez wrote:
> > > >> > >> Add a subsection for page alignment restrictions.
> > > >> > >>
> > > >> > >> Signed-off-by: Sergio Lopez <slp@redhat.com>
> > > >> > >> ---
> > > >> > >>  shared-mem.tex | 6 ++++++
> > > >> > >>  1 file changed, 6 insertions(+)
> > > >> > >>
> > > >> > >> diff --git a/shared-mem.tex b/shared-mem.tex index
> > > >> > >> 6e6f6c4..2021083
> > > >> > >> 100644
> > > >> > >> --- a/shared-mem.tex
> > > >> > >> +++ b/shared-mem.tex
> > > >> > >> @@ -34,6 +34,12 @@ \subsection{Addressing within
> > > >> > >> regions}\label{sec:Basic Facilities of a Virtio De  The
> > > >> > >> \field{shmid} may be explicit or may be inferred from the
> > > >> > >> context of the
> > > >> reference.
> > > >> > >>
> > > >> > >> +\subsection{Page alignment restrictions}\label{sec:Basic
> > > >> > >> +Facilities of a Virtio Device / Shared Memory Regions /
> > > >> > >> +Page alignment restrictions}
> > > >> > >> +
> > > >> > >> +When requesting the device to map memory into a shared
> > > >> > >> +memory region the driver MUST obtain the page size
> > > >> > >> +information from the transport and honor the page alignment
> > > >> > >> +constrains derived from that
> > > >> page size.
> > > >> > >> +
> > > >> > >
> > > >> > > will make existing drivers autmatically incompliant with new
> devices.
> > > >> > >
> > > >> > > we generally avoid things like this.
> > > >> >
> > > >> > This is the reason why in v1 this was gated behind
> > > >> > VIRTIO_F_SHM_PAGE_SIZE. But from the discussion on that thread,
> > > >> > I understood that, at least for the PCI transport, it was
> > > >> > preferred to have the page_shift field unconditionally:
> > > >> >
> > > >> > https://lore.kernel.org/virtio-
> > > >> comment/CY8PR12MB71950314C5683EB7CFF081
> > > >> > 5BDCCA2@CY8PR12MB7195.namprd12.prod.outlook.com/
> > > >> >
> > > >> > Did I misunderstand the conclusions?
> > > >> >
> > > >> > Sergio.
> > > >>
> > > >> I think Parav missed this compatibility implication when he said:
> > > >>
> > > >> 	So to obtain a free information, feature bit is not necessary,
> > > >> this can be self-
> > > >> 	described in the pci capability itself.
> > > >>
> > > >> Parav, this is about the MUST requirement referring to honoring
> > > >> alignment, not about obtaining the information which indeed can
> > > >> be done
> > > without.
> > > >>
> > > > It can't be MUST requirement as it breaks the driver which will
> > > > not negotiate
> > > this feature bit.
> > > > So my understanding is, the device indicates one or multiple
> > > > alignments it
> > > supports and driver can choose which alignment it wants to use to
> > > get better performance.
> > >
> > > Not exactly. The device indicates its supported page size (just
> > > one), which implies the driver needs to honor the alignment
> > > restrictions derived from that page size.
> > >
> > A device may not know on which OS flavor or which cpu flavor it may run=
.
> > So it is better for the device to expose multiple supported page sizes
> alignment and driver can choose one configured on the driver side.
>=20
> I doubt it's a thing though. Device has minimal alignment it can support =
and
> that's it.  What are "multiple page sizes" and why would device care?
>=20
Since Sergio posted v3, I replied to the latest patches.
I am bit confused on what exactly is the problem and how this solves the pr=
oblem.
I asked him in v3.

>=20
> > Keep in mind that often device !=3D host (device can be actual device t=
oo).
> >
> > When the driver page size is bigger, it can always align to the smaller=
 page
> size told by the device, no?
>=20
> What if it's smaller?
>=20
I assume you meant, driver page size is smaller than device.
If so, it can access the bigger pages of the device.

>=20
> > > Just to clarify, this is not a performance improvement. Today, there
> > > are devices (i.e. virtio-gpu) that doesn't work when the host
> > > (device) is running with on a system with a bigger page size than the=
 guest
> (driver).
> > >
> > > Thanks,
> > > Sergio.
> >

