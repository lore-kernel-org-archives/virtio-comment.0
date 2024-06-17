Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0134017BB19
	for <virtio-comment@lists.linux.dev>; Mon, 17 Jun 2024 03:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718594025; cv=fail; b=BH2Gp64NhQDSUlatnpGLFA9XhgUt+8gUohWCwv2AleH327CVXXEIPUGu4Yfi0xazezt6PAz0VeWWa6EAZB/EHlBTpWQ96LAd/dmZ7XcXirQyBuY8OJ2dPwIoODxPVw6ZmWkzPGQ+9lNbMMPCMXrIPx7Ib9Dn+kbet7pvSJm1Z+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718594025; c=relaxed/simple;
	bh=EjQjb2xYuAQmQ7/W8y6QvNSvuKrb1ne15RQuFLZydUY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Za26MWuGvbk9fu0Jpxbv/Q82KvGC2pOUCeO4NsVUDXmJmci/NVmZ/Qxj1KlUwH8zraGY23Nb1DCVCmYq58iXxh1CqgTLIwdso0VGbxZ+Wx9lCExyyRnevdq2EYadMSAM6W1wNnuRunywdbXHgfaKv1SR4IIKciJTrh2I0zBga1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E6k+p7AI; arc=fail smtp.client-ip=40.107.243.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E6k+p7AI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvuWzAm6qS0MInXpKyAS0/o6TBd67IzyTwcvj+yKPHfqJ/G4q9wSXrvRUGJiVXdQWmWPbfAPULLcLpxh/z860nlxIrOhgMP0lDbiuMZQQeAKnbNtcBkH1Et2w8E2d4Rq1fL8IUJzkMFNHVE8e7WKvoRmoO898PDeowpddzNgVg4hLYkrEU+BedMSpgHHd/K2bFEolCRRGCHIWSY+ehsQlkCKh5lJepxl5zt/ezB5ywbVal/anjUSuHYEskOn380onxQZHW0ijTK++s4EGnYpN+yL6bQKPuf9ruf+aqHCNaJ7hdZMEB+XTnTvcmTtDINkG4CWYVkOVrpBD4eATURb/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjQjb2xYuAQmQ7/W8y6QvNSvuKrb1ne15RQuFLZydUY=;
 b=DI+0JwTyEy/UxyNFK9Ol91WczRaMVYu3GP1cGI9YpyY2v8FtUDP9nPjcME55/50KT8LqbZbUU1F9Lxq0hQuyu+4ZRxxUIF+VMpteA8ZHBHos0M8KiRZW6HMJUht/z5m6mlwBT+y7Glp+2mLdwFLN7yxIBIMDpT/mxKnsEMxm8z4ty7zOBCGArJYqVj3ohAEfA4TCDntPWwdT6ahks5jpUKHZdKnscqs4IydiqmruPwp5WrXZ4BCl6VJHDwPl5pA6EeLLLg8+voVDh93etqpW4aXGyIrpIL+v598L8En5xpSpeKS/HpqWW7Bo2Ap98xrRWfXeWVKQHLRw8QquNUN9rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjQjb2xYuAQmQ7/W8y6QvNSvuKrb1ne15RQuFLZydUY=;
 b=E6k+p7AI+qndcjXAfUt2sEfnQgRAqiVol+wporKJ2+4W9rwDujT3gwuoh+y2h+gbYkKv5GiH7LPKxuaxt0TIQRDNjTls6L3wnxtP5FTRuSNHf/XqEhnQi1jZNA5RYYyYtnv7kEzBkb9N448d5LrFjvp2TpQbuz2qqI+caO0EMh8mmRmIODVzK9FnyPs8nmeqhSar0Wdf53JkOF7CivSc5SSrsXGpOlLNB3LCY1v0JBmzu3Ty564RU8yIYuPRqI3RzWxI6ZkzwaXWuNZdqFBpahPLtYecRBAZ0oyIUuWacId+ti+VwKCwaNfOPK4uc9Q+7i7WtuTVeZNF/QK5M1qJ4w==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by SJ0PR12MB7460.namprd12.prod.outlook.com (2603:10b6:a03:48d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 03:13:40 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 03:13:40 +0000
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [request for vote] flow filters by packet fields
Thread-Topic: [request for vote] flow filters by packet fields
Thread-Index: AdrAZCpSAq4LJFsESJ2jUsfYg4Fucw==
Date: Mon, 17 Jun 2024 03:13:40 +0000
Message-ID:
 <PH0PR12MB54819F551CCA2F00E3E41B1FDCCD2@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ0PR12MB7460:EE_
x-ms-office365-filtering-correlation-id: 367f62b4-1a28-4449-fad9-08dc8e7b7cc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|366013|376011|1800799021|38070700015;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?n7xAUfvZj/dxq7ljSdyjtVbGHApMxU9U/vVsqr7qQuHxvetsSYwl4KIzSRZZ?=
 =?us-ascii?Q?dL9IO3ccDTlJ53rUrU3pK6aqXTJ9yCU+qG2DZOusbuwW0mMBbGcR5yZWaxfs?=
 =?us-ascii?Q?9zKwuzDmq2WKJbNKL7jUg+uIOyaX0v6jhatfzDaAkoB3MjOEI1uKL5SraRCV?=
 =?us-ascii?Q?WF1k2xgdFO40rRsJ5fQEi2iVgjqrjt4nT/nZJGjgTYCNyPrygetgGPAVZ1i5?=
 =?us-ascii?Q?c4xwi4Mp2ETTcfWqY9f5NBSjrjGVIHmGLxU3txIx3NjpDxjWQ8igFaxtXz6p?=
 =?us-ascii?Q?9RNI0D5A48j+q05hltiMxfUXwqv2hTYiibpiGmRbNKChfwYx3NJPPBxg2t4/?=
 =?us-ascii?Q?IPub/SKkBCOzyNqigTBMr6XhAmc7GBHPgrzY8vl4FXVXISqeV02SnND3cFCS?=
 =?us-ascii?Q?x/pK3EJwGQZSxlWb3U4euukHTEA6vw/R0aivwMipn9sO/rItIPMCftbnyNFJ?=
 =?us-ascii?Q?GN+qPdVU4D7tsdcB+xUBwtL9IZB5Y7yQIqp//P1I4pcQLNr4a9DjbI2KSR46?=
 =?us-ascii?Q?p2Y9vIT9XVcUrM323sPapbacFNkSxx3jaCRXlL0t3TUzA6iQoiFYpab4n3r+?=
 =?us-ascii?Q?5C9qJCPTg9dBW7yGpeHIUfKB/hLhTYDYfQzJr8YWK0/mQkhRLucUiPihSy79?=
 =?us-ascii?Q?QpcNN0X3wRy9SgYRec/kGsJv0q/mnVL5Fudm0dVF3OJR0l4TSHLFZi3EUnMd?=
 =?us-ascii?Q?UR2sFXy+t9+jlXYag5f4OeOrsF/RIxBqJCDiPFyr6y0WNEWlaG+VibDwV8SM?=
 =?us-ascii?Q?jcgHXf2A4hlgOojeO5c2fNS0FD48spUAxJG8yvGQpV5Hvfxtoz0Srs0gwjsC?=
 =?us-ascii?Q?OKEHjiQGnGpTA/zjj3rpa5tEirQJni8egjHkqXT4k1Pvn6IyOFdXkirMBN0F?=
 =?us-ascii?Q?gfCMpXd1nO58G20t75sLnf+3RwUcdkNnmsG5WgvpI3qUn42y5TIokSmR8lpo?=
 =?us-ascii?Q?nL220A87YebzJUuEQo0UBQ4MBhYmOan8h6K77bJsLy5+1HC6JTK8TRUJRfPt?=
 =?us-ascii?Q?EX3baI6pg1B8EUA5VvUr9ygRWmvdhEgSP+EdD17eZB+0PjyairOZLJnCh8hK?=
 =?us-ascii?Q?Qf0UZMSpWwLBRtA3+p1AARbB7EpbwYHuObruwdWfJpX/qZ7ZzdV6F2lrk0BR?=
 =?us-ascii?Q?FHBuwTGCatBSy4zxTnTVZ96La0kXhmYxBz4ZeglE2m5/6/Sg3aPMS5qEuNtk?=
 =?us-ascii?Q?7AXEtWcAKtFfjDe0KeONQTj3yZgo0r31AInRQORg0Vu+qb1Cjah9Ja3Tc5i6?=
 =?us-ascii?Q?4ehxWrl1cAjQ+/J/GWo6Lp4KpmWql1QQVpMuQg7dtgNaHI02G1pTdEbZs3EU?=
 =?us-ascii?Q?9l710xRmfntDD33+gvFfB/Ta?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0/4qYQ3qqy8yJ+LBUXEtI8mp2DygsJf/TVroZIAjZ+LW/kCzFJLa5HwIeGpn?=
 =?us-ascii?Q?ev7PFelQv1Cjfk2Wz6+fwxUTkPnuWNZ1E/JVghFRdSIPxU60KRF23An/5Z93?=
 =?us-ascii?Q?zAgDjVU0xn0elPbq6e3LKAtfz4sK3a4YjBvqiMEd2+lba7tzFHhUnL0sG5/9?=
 =?us-ascii?Q?C9TR/Ux7uHC2gmtOk3ZYy7h42h6xYcl9FinpK60D7TdOzt1xASjkJWEVtaSr?=
 =?us-ascii?Q?4fXgJGR/BHXgq4CHNHVIa9QbveJB0e0vl19BMl9lHGugE/Vs/l60kWvTvpzW?=
 =?us-ascii?Q?UUWnf09a8a9hHUXPVzKb16q+Atmnkoxx/FZUDhScrSXx4HP1Ha7VVXDPZ16i?=
 =?us-ascii?Q?hotcaw2oZ7EOEru3KcAjzr/qA0Is8ieASnI4IGYFnJEqM4pVc5yQEHBTsmiM?=
 =?us-ascii?Q?IGdfwjSTpsYK1ZA30nMRixx/G8RgIsKmJRTphvUdNNlyNjqjGHkfDn8F7oea?=
 =?us-ascii?Q?XP+MV/1Fcv6KxygpwaEmGRE97rtQdNl0RpzLwP4XHmcLQ6vtxnQWfxh80M5m?=
 =?us-ascii?Q?6y523f5vFcTB4qic5uJb/39x67eiI4JUlJ4bp5Lb7x/+/rVzxbwvnqWbgAA+?=
 =?us-ascii?Q?/sQVhRpoZTn20HHQoClTkrbaqHYofqaOQwAyPj5XKMmAKTwNxamr03RVlbw0?=
 =?us-ascii?Q?uhsw4AMe6+7WKNfSfuX7nX3XNzKahqPCMGaDaAWZKyW82/NAYSPMJ/+oaF5b?=
 =?us-ascii?Q?JCOuEEOLvMwPXcgRlwCBWAcFwCbUvdxDva0MovOZ8mpwwIAYIsdWGgfbDrAD?=
 =?us-ascii?Q?OgkppAvAY/2BLDh7wr+A5xKDdUGWIhXQowcWhdbkq4lUPyqCwrVUQQT1ujJG?=
 =?us-ascii?Q?wwP26F7Ddpc/hs2njuzXjumnMyA7YwKYdGL8JYTQNmHYHsvOg6FeARCEVZcQ?=
 =?us-ascii?Q?ESsKmXjtIhS0YmYoLpDp6ZSRBVsghhdc1GaFZis010JxQEONkGMVr1fOpTjl?=
 =?us-ascii?Q?kce+umWKIdpZYGp8gG2u7dliI35e9J6EhfbwBLjMqeDTYpJ9ME33K9QrRAtL?=
 =?us-ascii?Q?o8eUmf/twjWoWbKmGLu6IcSs9AsdeE1458YUptxyIRo6SH0PLTaGeOaTRFQC?=
 =?us-ascii?Q?pnpXhGotQn2JTkXE541kILHsx/QIClOsYNhq4SBam4yuzYfFs+xdDsT9WAUW?=
 =?us-ascii?Q?4D94G/R258Cgz5CVE/60o/xGCgzlZMsU1KspOXyTMpxGp+ruiwvTJ0KZUHEy?=
 =?us-ascii?Q?m892Zw0rWX7gLIhMEb40IYl6lfbdPV77VHolQgVoQMifVvyr/fDjhkhS6+pF?=
 =?us-ascii?Q?4uKKMcrW8lSo3ePwVntTP5oimsvZLCWGR7WuX2ju454UOCOfyyveHEjWd2On?=
 =?us-ascii?Q?Mh9cHrGjJfHQeMzz+b8adYv7ImfoJGR1dOBwgCg4tZ3X0W3hvzNqF/mki7YC?=
 =?us-ascii?Q?ECuNiqxOu6SGMZwwZQbfpLbd8/F0uRc82AgMErs6hOPS8kKfckXNSmJMTF+V?=
 =?us-ascii?Q?Ud0trE+2L4Gzt8NjXbm/yKyF+ZFWrkV7eUkQDKwLhjFWbdhGErOxDwOW/ITN?=
 =?us-ascii?Q?m1FSa+I4/2t2sm6mYf4AQDOH6fPHDNIAg4x7pYl5jHRB69TYq4ZDCCtDJ0PQ?=
 =?us-ascii?Q?xWChF1KOBL+7nEHscOw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 367f62b4-1a28-4449-fad9-08dc8e7b7cc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 03:13:40.4970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c/L3ilVdcV2uZ81WBv6J6myBUnHDDW9NIwUylVFMGatzOyVhBFfrpPnPUPKIwfCCYsK0Lw4TzeYFktW9gzRCRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7460

Hi Michael, Cornelia,

Can you please start the ballot to for the flow filters series [1]?
It is for the github issue: 179.

This series has been for review for 25+ days.

Series [1] is jointly authored, by:

(a) Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

(b) Signed-off-by: Parav Pandit <parav@nvidia.com>
(c) Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>

It has been further:
(d) Acked-by: Satananda Burla <sburla@marvell.com>=20

(e) It is also further externally by SME Roni Bar Yanai <roniba@nvidia.com>

[1] https://lore.kernel.org/virtio-comment/20240604132903.2093195-1-parav@n=
vidia.com/T/#t

Regards,
Parav Pandit
