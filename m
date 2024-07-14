Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DE510A24
	for <virtio-comment@lists.linux.dev>; Sun, 14 Jul 2024 22:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720995638; cv=fail; b=JPObZBfUMuUpGHK46oncSUa05+anNE8ojDoqOyng9mY0qWNMQ/rm94UJEcmkU8TKxppmOT036I3lMVU8qjTLCyZCXV5xIC7uylo7fEcQwHNz2sClOURA1G2p3L6wuvPcypOXieRDQpa35CNJ4rmWeX6N4d/R4BfiLfsLaqa9e1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720995638; c=relaxed/simple;
	bh=FFUVQ/bq8HJ6c++vyUV5Xw7XpucMQqKMsXfFnI9V9Wk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JnjZhXNUCO6iTyN4ZLkpP5ZAEcCVmQMP/gDc75aqDjpjNWbEAT1wg+uZipW3dSMnlmJCBgx6rCYDoOD6pprkaFGGhp/wQUkx6eTb9NRSHUw+h8NzVSEStkWH8kW4iXyVAHKENoT59ohnG/oI2ZuWVazEpG9DIZHzkdD/fH/hOdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nvlpK4LI; arc=fail smtp.client-ip=40.107.244.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nvlpK4LI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bov4nY6GUsZ4OnCTx9dRPMNY6pU8RghLlHlOalLLdM7ZOy5QZniHnIwZlAhfAe6QBtHZG4dB3QYhDVYyf6ekW4q2TMJd1HAZQAwIXxGvzF34b6ofaLmJDsJpsjLluIc6QnHpG9YRB9pHfCvFqC3O+KJheIfjnsAqNDBXnRtoNC6/tmS+SZA/km/qBaTEH29j7jN1xYXlqB+vyJGmB8+lkAq+lsDVd7rkhcA0HwmC8Lbk11WI2EpyF44TBxI7zSmcZEwHzkO0klVcfmr7+k5BzV5kAx63QZI14kDU48A/2P58UvDGGgGAc2jkf1365zm78eay7YCgBwOkJRrp2FVNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7JVIDlI6Ewv2/FYyQN5MfqWaM+/HzQX98cgQVu5m20=;
 b=eev6RuYSUDvBuePApTckyqSP0iY5ioj+1hP9epPnQ/yz1eU2ipTSZL2QO+qeLct0sNBMLAOe2BYzn7m0/REnoEhrGtKgy9aZhCWqik9hz/iX9FJrUE6fZX12Sh4AIMkrkgHgDo04sALqPjeeWpJwrrv3xWkzC3jxWSkB9L5FVft+v80ZAnoSpIUPPh5xjDJCsBmzdQPvTkIv2rSJPAEgRzPXhvDiZTkqKA0fKR2qHDf7Cb1OwHbfku2J3mXcqPrPs2dHO5e7+b18di77A+crAsgHLKgfN8k5na4pR8KHPSGs75gGyOk7PYlVyYRGEEO1v3NuBp99FaKkDIVeuIvEPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7JVIDlI6Ewv2/FYyQN5MfqWaM+/HzQX98cgQVu5m20=;
 b=nvlpK4LIwGcG/VQuconn8H2p+yc6mHBwraak41+cCYWJPXgHGt9XQlbCeyTLxIfGp/lO3WQsm882dR91pC/stNQmPGCMKqwTmZ9qutd6opQ5lOORpnycghdz42gs8cFOi8GL7u2jtlbdFljp0XP8F6Wkz4bMaInMHJUFrour9+tVJU7XG+1ul0SXSIkxOGiQCoVVyHCvHoSKgl5ZQMq3NBbxUteIY2kQ8lQ6Ik9qUw3BkSSBteP08FAb3hHEpku/LwPnKMbXFWP7+KfODjHczpP+i75uVJgYa+Hoyz/QPy81YXYy/LBzvycmW2gts++O0JH2OVUMIQszrHtTX2vqfQ==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by LV2PR12MB5919.namprd12.prod.outlook.com (2603:10b6:408:173::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Sun, 14 Jul
 2024 22:20:34 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%4]) with mapi id 15.20.7762.025; Sun, 14 Jul 2024
 22:20:33 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>
Subject: RE: [PULL v4 ] administration commands for device parts
Thread-Topic: [PULL v4 ] administration commands for device parts
Thread-Index: AQHa1f6qzwZkyo0BNEK96TjFXC/wr7H2XzwAgABiPNA=
Date: Sun, 14 Jul 2024 22:20:33 +0000
Message-ID:
 <PH0PR12MB5481DCC7A15A54F6595AF7F0DCA02@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240714150028.3292710-1-parav@vr-arch-host06.mtvr.labs.mlnx>
 <20240714115023-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240714115023-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|LV2PR12MB5919:EE_
x-ms-office365-filtering-correlation-id: ba24a5cb-fae7-4260-05fb-08dca4532dee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?goDJNONXv44hdGMWQA/fdnmtVk7vh8H5WskiF3/9/GONgTILyuvgvdzoFBQq?=
 =?us-ascii?Q?CcxFyGTKppmwHpHGBR7kfTSuOr4DGSqqsHvsXjqql5XpggPI6tzWLOsUeGhR?=
 =?us-ascii?Q?qys374Nf9y4vGX1CSPHO8ZtG6S97R6JtgfZmGKFeadWMMr/ulbq3KF2MBypU?=
 =?us-ascii?Q?AKSMogc96OBb2VbyPjab9UEXYY5ZUFvxsuhIS6CTfj7gnUziw9sE6W5Qol3S?=
 =?us-ascii?Q?uJ9bXXXJMJ17jtYChv+3ee3mV9FwLuI4S8gDPlnFLU+zbFujn+yKX1QIkxJM?=
 =?us-ascii?Q?u9wgKuzaM282WpQB+zcJbhonop1Rl6TgG2y7CDTeGlKo8qkdeXhHP/xAPU+U?=
 =?us-ascii?Q?RHGEydNL4SrA7FRAtn97yBoXULo7mPwd6taU37fTHTnwza3VDzRXNU6zLv68?=
 =?us-ascii?Q?g22/thxs9F8Er4wNvdGeSLEesQUUo6kUKZHtWewG7qjn2L/rv0ASgtF+fbRE?=
 =?us-ascii?Q?gGIOHGySUA5yhRqKJ5TzfNS/Y7ua49Sz4qgYgkaamqcV0AB2oEAKLaXkjLc5?=
 =?us-ascii?Q?qtJqsh533C+74hCeuvJOC0jR9FjQRbB9UmZDMcwInc/RgDEj77fiQ1ndLwbv?=
 =?us-ascii?Q?FOkMw9DFKlhsepYVJ8vi/XLzW6voGBi+4o9MueDO1jVDDCwEfo9P1KEm2g8h?=
 =?us-ascii?Q?EISRwdqts8V4XXekBQ/6CKUnGMUypR9yqlHtHzf1e4BKkhJnQwRU2G9IoUb+?=
 =?us-ascii?Q?JIAt1/owLgGV/tWA6pI0mrvWlNptCCFJdyfjFcIAvc1Lt0hYQNU909ZxOJTC?=
 =?us-ascii?Q?dFlXZmnb2W7EHmXaG6FUIRB0drG6IVCj+3PVU/xrG5HlzpfPVSq6DwhqTwb+?=
 =?us-ascii?Q?pJ2o6uMnjbp3OGWl0fWXiF/icAGHXzzHlOR+bB4OZWo0D6Nieg7QLYni9A7i?=
 =?us-ascii?Q?5OJuqQYUEeV1iWWTlhHR/aZKI5IkkBfcqI2LFhk/HOb+oudkhJ6UNs5xbX35?=
 =?us-ascii?Q?SEMJOJY1NJ9deUMfqFZcIb7pKlV71kjIqj3WcBxEO/gLU3ln5jBuiPchNCZN?=
 =?us-ascii?Q?ylh64dSOxWc7ihHvUW+tzFcYH1nwS27fnIa7/I8bZ14e2l7na6HelKXJXidk?=
 =?us-ascii?Q?x8Qz62TOpaGU4wcO5dfSJ3AFzOgUOT0/ZrK7z9H4GyGTc7dJmtyhy1c5pqRZ?=
 =?us-ascii?Q?24Xq3EllvbxdI0VNv1jai99AFH569bWRP+rFlfiQczeVEGg0sNkaI9IqGEgU?=
 =?us-ascii?Q?uZ/5yEsVj2BYBv/8a7wM6NmpsL1kZA71j6j7QvFxFTfXq1OZ21/oTe++qbX/?=
 =?us-ascii?Q?LdZ0JzykhreYUeicMc37da8POXJ2FmdsxRuIObDN8PDB92mt6VPIocxOSWeM?=
 =?us-ascii?Q?rtPDg+sj0BJto73OcLiqudBUggKna04/60VtWyVqAj6PNRd+1GWB/hrGW0M9?=
 =?us-ascii?Q?iUY/Wwg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oB8ubI6eZVzmSo5nUzZqEIUNqD0Ibc/AOOdxHkuKJ/nNXfYof6AduvkBtukc?=
 =?us-ascii?Q?tvZNjXygnyClZmIuEolC/qcwAswjZJiBhxtaQ+6nWEGuKCyA7f7ARy0llnRN?=
 =?us-ascii?Q?v9cOIwiI0f9gzkWsQORxsMdD5Qae0vsvoH1cD+Oqazuf6M8MeaUGhilOkcmE?=
 =?us-ascii?Q?dMBP6a0HR444TrV4DLMMzKNwg59P6q9Yu8HgxZybZ2dsox4Xmy8LkP6NKOcI?=
 =?us-ascii?Q?09RyhzPa/8c05HkjZl5bAiDcJ44oM+MAUFD3pkfYRKfxb4EJJV31eoqzsvZe?=
 =?us-ascii?Q?choEM0HzCTeN9ZAYCCaEKWDpk/dDoN3YMXnrXcCRZtnk/Pf20o8ex99YHTVh?=
 =?us-ascii?Q?Q1XOjm6ORndJNBgZPsp099lUh+5rYautq92pmQjl9rylQr5MdYUSd3XaDDZv?=
 =?us-ascii?Q?h9kVzbhf15w2QZLlNMTiR5dYGu9KCX0ckPNCwgyJgfQoF/UeORJKzQ+oPqkr?=
 =?us-ascii?Q?tBLywJOygMLDURq0N294XXcoc3Vis2zDfPT2oVGtKhUUjIkoFq8hcruc74Hz?=
 =?us-ascii?Q?rDNDkRekmXl14TT9nlCfUDhRFEWLToQvSpq1o/T5YfyXN/h3VjBxLyST+FSQ?=
 =?us-ascii?Q?zSmUWjYL35evWUknqjT495Lby0XdLDk2rRIzvX5nsZBMTccjwv+ZChFO0ZYF?=
 =?us-ascii?Q?OHWL18HHNziTJI/Yc6WCPdm2abcM00WW91ZjC4vCz4QMg3TdNL3DHHIjTpKT?=
 =?us-ascii?Q?K1P6/P4kra8iegouJc68rnEWvR849e0tSZUdsSv5Qsbz8YZuGAjtgY6lNekE?=
 =?us-ascii?Q?yZSwaaOZXtn5MUk3a8bZNUqosTT2qv/klSVlQAdIR+zbLgUuvSXZp/N1Hf/5?=
 =?us-ascii?Q?7kEU9tgkD2gV6Zsa4heaAsIRPWBHn+nrmRZ/mv3QCeaglETY7Tf0eJ2EucNW?=
 =?us-ascii?Q?QQQ7CWjZkpdjyFxai8HznGz0cU6xje+Tyj5OJbCM1+JTCotSFFcAPVekrjf4?=
 =?us-ascii?Q?JqqDkDInkJGQhsAEK8pJMzOQVCQho7Ymb3rIM5bBQRYHWzvCjs8/DwrtNAWk?=
 =?us-ascii?Q?0VKHWaiExteB1AINVDcS5vLedUq4iYAJpT4G+VrUWZK7IGWvEp8tj6S/EFbD?=
 =?us-ascii?Q?L5EqWUzn9xRtq9vh90bDKEeLfW4bUOZP4+nwHJAN2XI9T1O85/6tHNmNMMcW?=
 =?us-ascii?Q?ItZj+NSLClOFB67n6wGhaEap219WCYzE/mGiOclXDIYvGxnUpaFMiR4JTFlT?=
 =?us-ascii?Q?BkHRA+rSNyVBJKtxRWf7fsr3zzhZ+RQrsYRAkXmridLCG3xCi3YN2HcpFyaQ?=
 =?us-ascii?Q?jt+KDszP1WCBpQj4CeOY2IqMoEWJwPKeHhH+LV3AMh9+s2v8iKwjRbVSHyug?=
 =?us-ascii?Q?Upi6zpYi2faWYBamYZwmSomJq0S+444duLSfeXe0weovVXK0SAnUuMjapmUd?=
 =?us-ascii?Q?TaL+QY10nIqrFI61cRP7p2Mw9xGZg4vq8jRIyP1DOa9yy5YwsZkLvxXAqtLt?=
 =?us-ascii?Q?1pXd2ANNgL1msGvlnRX4mPc8L53ekQFPF9CBnbWRywDD0ETcdse7Kg5nS0uf?=
 =?us-ascii?Q?zIoPjA6W+YAsBTVDeRuMMn+bFFnqvSkfYh3zU5c5szkrW654lz3Zvhu1TJIE?=
 =?us-ascii?Q?XwL8TvuOOCfw9eYIBcI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ba24a5cb-fae7-4260-05fb-08dca4532dee
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2024 22:20:33.9297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pDx+uglZ4fVZP+3zCQxd3F5DZxVscukD5t/boX55Sbx3QOldOMXUOtNKnTw6ruLr9s5mEic0DofAFM4QIp80GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5919

> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Sunday, July 14, 2024 9:21 PM
>=20
> On Sun, Jul 14, 2024 at 03:01:07PM +0000, Parav Pandit wrote:
> > From: Parav Pandit <parav@nvidia.com>
> >
> > Hi Michael, Cornelia,
> >
> > The following changes since commit
> 9b3129fe72360a78e76b6dd890d3abc5a45fa915:
> >
> >   virtio_pci_cap64: specify offset_hi, length_hi endianness
> > (2024-07-12 06:43:53 -0400)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/paravmellanox/virtio-spec.git tags/for_1.4_v4
> >
> > for you to fetch changes up to
> f89c2818bba1bd0d80bb12372973deb6908931f2:
> >
> >   editorial: replace hyperref with ref (2024-07-14 17:44:14 +0300)
> >
> > If the change f89c2818bba1bd0d80bb12372973deb6908931f2 still not
> > reaches to your expected quality level, can you please pull upto
> 52d320c8b3c54ae035c0ddc1d23ae997cbfa13b2?
> > I will supply the requested improvements on top of virtio-1.4 branch
> > on top of
> > 52d320c8b3c54ae035c0ddc1d23ae997cbfa13b2 once merged.
> >
> > ----------------------------------------------------------------
> > This tag contains administration commands for device parts
> >
> > changelog:
> > v3->v4:
> > - addressed Michael's comment to add fixes tag to the patches
> >   in editorial patch
> > v2->v3:
> > - added message-id to the last patch
> > - fixed reference to named reference in the last patch
> > v1->v2:
> > - fixed hyper reference to name reference
> > - fixed typo in commit log
> > - reduced the patches of pull request due to rebase of virtio-1.4
> > branch
> > v0->v1:
> > - resolved merge conflict for an empty line in newdevice.tex
> >
> >
> > ----------------------------------------------------------------
> > Parav Pandit (6):
> >       admin: Add theory of operation for device parts
> >       admin: Extend resource objects for sr-iov group type
> >       admin: Add admin commands for device parts
> >       admin: Define common device parts
> >       admin: Add requirements of device parts commands
> >       editorial: replace hyperref with ref
> >
> >  admin-cmds-capabilities.tex     |  16 ++
> >  admin-cmds-device-parts.tex     | 469
> ++++++++++++++++++++++++++++++++++++++++
> >  admin-cmds-resource-objects.tex |  29 ++-
> >  admin.tex                       |  12 +-
> >  conformance.tex                 |   2 +
> >  content.tex                     |   1 +
> >  device-parts.tex                | 232 ++++++++++++++++++++
> >  newdevice.tex                   |  24 +-
> >  8 files changed, 778 insertions(+), 7 deletions(-)  create mode
> > 100644 admin-cmds-device-parts.tex  create mode 100644
> > device-parts.tex
>=20
>=20
> Parav, makediff fails. Did you, in fact, run make diff and inspect the ch=
anges?
> Because it's not really practical to review the whole document each time =
...
>=20
Without your last commit of makediff [1],

I ran makediffpdf and verified the output as well.
There are some warnings with xtabular. I will fix them.

Makediffhtml.sh didn't succeed due to missing xtabular.
I sent the fix [2] for it.

However, with commit [1], hitting below error for makediffpdf.sh and makedi=
ffhtml.sh too.
=09
HEAD is now at b495841 transport-mmio: fix up makediff from 1.2
Applying editorial: allow for longer device id table: makediff 1.3
[detached HEAD d213eb3] editorial: allow for longer device id table: makedi=
ff 1.3
 Author: Cornelia Huck <cohuck@redhat.com>
 Date: Mon Oct 30 14:42:05 2023 +0100
 1 file changed, 2 insertions(+), 2 deletions(-)
Applying admin: Prepare table for multipage listing
Auto-merging makediff.sh
CONFLICT (content): Merge conflict in makediff.sh
error: could not apply c69ccb2... makediff: cherry pick table env change
hint: After resolving the conflicts, mark them with
hint: "git add/rm <pathspec>", then run
hint: "git cherry-pick --continue".
hint: You can instead skip this commit with "git cherry-pick --skip".
hint: To abort and get back to the state before "git cherry-pick",
hint: run "git cherry-pick --abort".

[1] https://github.com/oasis-tcs/virtio-spec/commit/c69ccb2f16e09e5dab9b939=
9b72b701d51f26b6a
[2] https://lore.kernel.org/virtio-comment/20240714221837.3323459-1-parav@v=
r-arch-host06.mtvr.labs.mlnx/T/#u

> --
> MST

