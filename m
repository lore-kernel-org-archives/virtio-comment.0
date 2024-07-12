Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0B816F271
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720789131; cv=fail; b=js37T0Bgxs/PUwDCS3NcWq3aa22CwoNwvT6CCGm7NvaFDnjQduq9Kh5cavFy0J5Mi8MqPkCUnSMqLxlL70zhvMMmVwNEBSyLk/QXXVL2IXyfhJ/Oc+uQixDxW67UEUovIejK4z80MfZnBrRsLzH/ZXkFQX8izJkLstH4pAt6CvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720789131; c=relaxed/simple;
	bh=i+UhbNoKIsb48VhjPHR9tMtSqP5EzS9qzciIxeb8wm4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ylqbh8uo6n50MdRJt9B9d9udanRToRkcezQoFx53csCI3/u1jj76yLXcK5JV5OkNW/9m1EgqPH47kwjjl2SYk05G9Uwq7JwKwZ+6DlSXh5PQ8zeNs1mEI5n0HVVn6wncn0FZVMfnmNfISdhFNGYoLatop1HB2JOV9RJSFHZFLSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qsqk/ud1; arc=fail smtp.client-ip=40.107.243.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qsqk/ud1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lH9wOKb1HtW/ScWM0B4V7l43AdVoC5kQH8ETnVd6SPL5SC5oHX+hibe0ylcHkD319XgL1yebXpzFs3V/fzTxGdXy1BeBBinShOJU3e5uEyBBgOmzp8x3yc9PCS2zCnVYgUnUUMG6pBfM54vpMoFDX5dtJiJxf7L6JSVWSneDGh/yPn+05+5TGOoxV6jMuLUzn5/rmp+bAteky6ZkO7clhvOozIqJX8WoJ103QVa4kAau5XhKa++eMRwVi3ayxY3i5Px/KGYNzHULLYdTL+pONzSwuRYfXv/AEt6gtvxWrf0V4797W+Vxdi/QqDn4uDJ6tvSPT329miO1jIlGeeMPxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JASMvP7h+ZS5BZyLg5TRNqzYcPDocfOKyzGcIXbpUZY=;
 b=AyQborQGc7TSgXqtw4y0viWt0Hl3tz7o29VtMVcf6cjnS+IzhbzKrzDTZnY+0AFreh6XLMryXKuGD3E91rOE2fuZcF6huAOBNDuVjLfo//+KQy8A8AS99KNawjvYgNu19W39+uEw18lI+gBVuRrE5fdeqvTKD0SDPxn8HGEo7UApJ+Sbd8trY6yeZksD9UL3r4mcdUgBNSzwc/rdKnbEpFt/8iKGfBXJf11sagvuO9vdrwi2H7l75oEhrd51jCT/lFlUdZIm8JIxPCwDiQPhxXQGgLiRN8FVDDUitXWyVdNATJlgCYqH7rtVMWkdt193xspubPJOI24LNyVuxFDxhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JASMvP7h+ZS5BZyLg5TRNqzYcPDocfOKyzGcIXbpUZY=;
 b=qsqk/ud1QKgAiUWLGSzkSxAhJeBNshxuPoPo2FWqtWZwGy3So3jrx+P0hEsOtAF873XrhfVuiv5bqVCh8SdOUJfrcJK2jmv3fP0Sv8T6F5soakQJEZZHuHSl9TYl6wLT4yqfovyZqvO4lzq+u7X8q66sswcE8nZZeztXFCH2gOSdlk+qzJAA1ITxNSfyb5aA7PWSifd9Ao80FJR7/gDeTdrp7V4/WLJg4M8BItei4EEkVi2DQeZ0y/k0RyhquDsU6vfmOoYD7SLRM1BS1p4Bm57F/c8Vgzp4+r5YM5HaPa53h71UfTDTRALcWkEZHpewDkHXypQqagv3Wq1cmXHf5w==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by DM4PR12MB6663.namprd12.prod.outlook.com (2603:10b6:8:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 12:58:42 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 12:58:42 +0000
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <pandit.parav@gmail.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>
Subject: RE: [PATCH] editorial: replace hyperref with ref
Thread-Topic: [PATCH] editorial: replace hyperref with ref
Thread-Index: AQHa1BIat6yqkExuMUOjMUW3abrvLrHy6SIAgAAAdACAACSscA==
Date: Fri, 12 Jul 2024 12:58:42 +0000
Message-ID:
 <PH0PR12MB54815C7FFF618290CAD55469DCA62@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240712041433.3246718-1-parav@nvidia.com>
 <87le26c2i3.fsf@redhat.com> <87ikxac2fd.fsf@redhat.com>
In-Reply-To: <87ikxac2fd.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB6663:EE_
x-ms-office365-filtering-correlation-id: 7f15df90-9914-4ef3-97a4-08dca2725b66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?klpGvxKx8ReGCqs7lutLbbdcs6R6VWfXqZ1k8ikYYtFLH1I9MR0JkSiFvLP9?=
 =?us-ascii?Q?eBNmxyPtRF+EtgwHQPYdBv9l40EFgP+WWPNZF/wha1dEyXASuy62LY/g1ayd?=
 =?us-ascii?Q?ac9kSxdmBHxtH07CzdHPSxOA05N+HMjfIqFsOHXQaSFpfwha85tRiCCW+XTE?=
 =?us-ascii?Q?jql7zJSMuPN2jMf8G7CeEbh6E9ibktkE8NQ1fPII11zoaA+75ZhTP3SeV4IG?=
 =?us-ascii?Q?LV7X6k4VuVi38xl9uw+2mjprgLgI/S0lFY2IQaAR/CVqnnzNEqhjYz9BKT/F?=
 =?us-ascii?Q?hv0KXMcnqDpctQdiuC9EdbSoCxTk8/d9O0liAxn10UleqwbcjCQUs5mUJGtq?=
 =?us-ascii?Q?Rrxr1KsfV76iq62YPsKpCRB/5vOsfz9nGS+wvD5agSJYt9BcqQvLS+GF+u4+?=
 =?us-ascii?Q?tFhpsB3VMzwvft7XCRpX9Ki0eX6+WcnXRW/2QKbIT2pw5mALSqLR4B6Wdx1W?=
 =?us-ascii?Q?7PZ3jNZdwz56QxBSw2iDxa3OPjwTVdIc7QPNArJ1Tbf7iurcMwsQ49I5hsSX?=
 =?us-ascii?Q?qXb2NqwAzsKk0lAhQcH9m4AP6tpaO3rBXsONT1Qw1qv8AeOupjzkwJh5tjCd?=
 =?us-ascii?Q?G8Gh1+DLvdGBhsOfd/s2PeLoowdq/cASuOxYTluBg03dXoLJUYJu6ILgq4BI?=
 =?us-ascii?Q?vLdKWHl2klOl5sY3k7nnwhOw3ljKJSwl5u+aquWZSYlQLeINNN9mZCapdXsM?=
 =?us-ascii?Q?ioCDBkUu4wHoR0xjTLDgz+Zps1W+02QAU9t4uiyIWE6Nzi2QGG7RBS8clgWO?=
 =?us-ascii?Q?cB8VayMOkv8sSklajC5QcxmUhofz4pXfSvo+Zn7SGv3RMztiqKZYD3rJ4k0+?=
 =?us-ascii?Q?O5S5p8sOgCHbFvhKdYoUQojUMClIu3it4g7tBGPJ958CyVo34FWQgO53lGU9?=
 =?us-ascii?Q?/1wufOWWlZRybEmsSFPVzBWswmMzGhdiibk9KYVPYnndJk8uLVBXKEIkWfDF?=
 =?us-ascii?Q?Pj92kMjvyk+EuQV2CbZYorOx73UG033KJnW0pjB3j+tLVxGZVDNB6jBiUJx7?=
 =?us-ascii?Q?cof1wB/MB8c2bUJRJiv3zlwxfLADQSxonImS0SpTBLhXS9X1jpmXSAqvT7sR?=
 =?us-ascii?Q?V0uvd8GDQy6qhgvxsfh4ZVE/5/osJk4msMFrD5K22sM5EplR5Ba5ngVd8U3K?=
 =?us-ascii?Q?lUanfKKe6T5zb6TBkIwTFpRr1I3rGQWi9DgtTj8He8Zau8ZnhbC8QC14r2W7?=
 =?us-ascii?Q?FiXFgVsmAobI7abg41F1SrqFVsJM84tYxetGKRxXQn8daPmdBjs/m+MFUclf?=
 =?us-ascii?Q?u0msdmC2XOkB6pHXk9TOCfiJTzc/rQ0rNCdjWn3c+n+BqPpQFemFXJ4o1nVE?=
 =?us-ascii?Q?a02X/HnYNJIa9Yy/MHo5FLJVQX9Nae+kqU2CP0/JGIZrynvj4iuyMThlCHJe?=
 =?us-ascii?Q?Mli2pO4ViE/XafeA9cAdeezv8nw+CjhZ9690eaaRJM9iA7tj0g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?819a5hVtWYCcYZ4ZrcKgCOg479pyC335tn52O81huiu2NYndafJM/uYFkTjQ?=
 =?us-ascii?Q?VdxYGJ0fLUgVQ1bGODS0S1pxXy1xQjKpg6JU7JEJPMmB0CyjiwRM2ZXlMzX4?=
 =?us-ascii?Q?fhzSeCSmYM0A78CNBDNq3T/hgwtiGlv1HYjnVEsQE0lS3ib8TzywXrcNXaQj?=
 =?us-ascii?Q?eTBbH/YtkWSjqcU+JziRTtUvj0Kdw0+I7alkWxQD+W+1jPg+fAjhigTTG8WQ?=
 =?us-ascii?Q?AnvAXdX0KZ2OqwXujElsQ4QCrkUF5v21PI8UqkgjkSG7QCo60j6WNR3v4cMH?=
 =?us-ascii?Q?3xBgHqJtIrybyL1LLgXA2TjoQzunWTmi4DxS6M5P96APUauMvi+nW/Ni1RzL?=
 =?us-ascii?Q?FI9swx7B6JpDHKUxf1sHs6Gvz7c1UXcwSdMsavOHT/F+S36iBSVF4L9YOeKY?=
 =?us-ascii?Q?7tA73N/j+aveAliId0emj2n6azZjpdATXFBADxE5QBw1TRJ+gEwQ8jjdRlDC?=
 =?us-ascii?Q?iGZhxJe4ZdduX5oqtU2DWG2Ul0fqOCrYgLCMq+ePUcxY0m54w8efOzQphVS+?=
 =?us-ascii?Q?HwDsgBfUy9pMlpP+7yrETy2dXaVbEy3zj0UKpitu9l3KBQEd9ePIzxAq/ip2?=
 =?us-ascii?Q?jFL4ZqfoabVs+nTtqzqDP/lyd53wNSogSWwZ9BgBZFljYFJ/kC0l7riN6H6g?=
 =?us-ascii?Q?M7451SEMhMeYhi/tgeX4utvs9iEct3PU5Bo9LJm1/wAA5nuBVYCrs8t+xB9I?=
 =?us-ascii?Q?NxuMUJPNoGIA8z4L3TN+SROSU3R77L0l7E45YVCuVeHRHcgAsmto523P+Fl8?=
 =?us-ascii?Q?PdWJWYzQH1fQqN0QgDomvoK84HaAri83etdQZPJLLkVWOnqjql3I/Hf2orBb?=
 =?us-ascii?Q?0wG3hqOq2akJ9DjZSMkQE3cFs2IRUTyb7c0r256C2ssphRSZRjpWQM+U/U2k?=
 =?us-ascii?Q?31wis76oswphAe4HJNrl31BKjgj5Ili+F7Df7A/gn6X6nI5HJgHqsvs908FM?=
 =?us-ascii?Q?jLrhhUQJnkxBImHSHXfhdDwvwqmhn5XYVETofFDLpsESXYwGRx6Dig+ii7jb?=
 =?us-ascii?Q?be7WdYR3VBBNUD/A4/Oh4N9fT54Flj04WVAffX5ckZZV5alQIiiypwYGViuj?=
 =?us-ascii?Q?rOxBn3UqXsjkKusG3XiFGZ79MiAUnDyt0g+VWzwFQg67OZHpBEdhfqN0RCn4?=
 =?us-ascii?Q?V0V/2+GOdEo+TCxg3zJjhQCMT8Q8VvKNusUk508psFfpcEQjE9CnRtdYwzwR?=
 =?us-ascii?Q?pt2Xw4K+DXGsPL3BAt5T/cixDjs/O5u4xqvsdBnIkQxxcJZrVqIypRwy9/Gf?=
 =?us-ascii?Q?kbMSNFyo8t/YMhSW4JuFKxhyKSSHpFut5VFfESw11ob8Wzd2qOSKjSQeyhy1?=
 =?us-ascii?Q?miwztqSvrinfB5Hce9kzmEACjty1kEGiLhsHMgMLPurWhmBHvacSt5bvdWzt?=
 =?us-ascii?Q?mxIHvUerzlOf8fbrZ0zhg33GBSe9+YfQsJ9JrgEeSsBZ9pQziWbEUleZMGsB?=
 =?us-ascii?Q?ubF2iQOrgPJGlv9TBJhviNRPziwv09qoOfvtOEL4jgFfQ4VwunPhMmLYuq6q?=
 =?us-ascii?Q?Au9LkH1My7XulbbNUlITZHfvrrpvbDwSRDBL7jx2h4M7UIyRaz6jylmFCl+Q?=
 =?us-ascii?Q?8QqsxSvbKEuY8gE13T8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f15df90-9914-4ef3-97a4-08dca2725b66
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 12:58:42.1833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IY5U9lmWVy9Hj0mVt5yp/PfihggB64i5uwxeV+obiDhzguTogpxz+UxBjdX3ZrZjABYT8JY9w5xhJc+XZKX30A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6663



> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Friday, July 12, 2024 4:17 PM
> To: Parav Pandit <pandit.parav@gmail.com>; virtio-comment@lists.linux.dev=
;
> mst@redhat.com
> Cc: Parav Pandit <parav@nvidia.com>
> Subject: Re: [PATCH] editorial: replace hyperref with ref
>=20
> On Fri, Jul 12 2024, Cornelia Huck <cohuck@redhat.com> wrote:
>=20
> > On Fri, Jul 12 2024, Parav Pandit <pandit.parav@gmail.com> wrote:
> >
> >> Replace hyperreference with the reference.
> >> Fix the broken link refernce for the DEVICE_STATUS part.
> >>
> >> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> >> Signed-off-by: Parav Pandit <parav@nvidia.com>
> >> ---
> >>  admin-cmds-device-parts.tex     |  6 +++---
> >>  admin-cmds-resource-objects.tex |  2 +-
> >>  device-parts.tex                | 19 ++++++++++---------
> >>  3 files changed, 14 insertions(+), 13 deletions(-)
> >
> > What is this patch against?
>=20
> ...seemingly it goes with the patches in the pull req you sent right afte=
rwards.
> Please always state the base.
Will do. Thanks.
