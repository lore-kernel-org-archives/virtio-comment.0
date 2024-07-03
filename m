Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2132.outbound.protection.outlook.com [40.107.215.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D313C1741D2
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 12:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720008852; cv=fail; b=XoMySBj4EQqBLzmC0PvSzxRmOSz/cn12OYWeisyff0kCwEcYYRMkjBttPl0gtqbm4qxQPh0YYlQvjSYLb6bBR8Q+xvxbFDpkiDUFbrXNCtn0gkcwTw2ME+xIT3AQN+Dh7TI4gvx5U0Uh+LjrRLpxhk5kv46L8lt/ENYuuicczog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720008852; c=relaxed/simple;
	bh=yPi7PkR4z9yxfUrekWCUYyUS/vDFlXkNrSRG6dIL4+M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rBjGtHaSsDzloXg/kfjj2cfCTGMX9to3gQ1b2/rOCVVzF7wLEMN5ADZ3dcAs7L+8kUa13M/UHMwxCwB9WwgNNGo32/SNDhhvoLssyK3xAbQP/oq1cCylI8VyRHahPhI5ySNWqPhoePvO4KFzOHwAzaqqZrinPi0cFf1dCUXBmVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=M/+d7VJ8; arc=fail smtp.client-ip=40.107.215.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="M/+d7VJ8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRwB1J73dKbSSNOiClRoih6EsyfUH/BkeKN7WLKzajX6RX2Gvb+E0lq5x9G7BuA7Y3MEy8IMXP7FG17KfJ6V65BoDq3osderS5UaEWqIByobEs2BX95aAqGHoru4iiFzIetvDobDHtsJspXxDVfhjr+T2O27Tj+Fnj2u8xjCXEOJIlytT/LKHNFUZUbf27Njej5kwL5a/4S91I/1ZfxeKnz5lNnt4PMpVTjIFJ8VY9/j5ItgftS7WKkJ6fkYmnkGkdeM+m7DeD7J/73SKMMgK55qvbLyVQOwFjJt1IJ4QBl+2LVb3h7bAtezchZ/AR1nFkVQav7sjHwSgzpfWiRefw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dkhed/40M0o2IGCKkeEwS+qjBmeOzccIyNZ1rrFlww=;
 b=J1eGEP3xW9WrIpWomKgRof7RU+RfIt2GT0qbY6JAk6tfLmaaTz0rfNuNpNaF3QWDW4z+etqgk2poCgTLrQD5cUZRA3SQzNKaYGofoBe/rGGFsY/mMotBu9L3ILd7sDKw5BNpkxYT5sMOsiOqi50wsnmQvC46Zv4YG5bT7VWTsED5yuVKYSxkX/xtl0EyTGbQz4bfWF9qNDlYLq9oFbwnxSQW4tak/cVCF9ABvqVPJ4mAmdHeTYAo3sZQGKnJTSKnupQ0bqxxPDBQ2EwJYkjkTCVv+8SOMl3EEFJc5nRbzpWZsjf+74QAlpvEyMKu7SOLB7bOANS2oDIThV42xAd5vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dkhed/40M0o2IGCKkeEwS+qjBmeOzccIyNZ1rrFlww=;
 b=M/+d7VJ8dIc3BLEqzZPTYSS4gQ5P6x36D/hSdL4bJwxSqsUHts1Tb25Au0YzpT3pyX3i2WSfoKj/ywmHwUPmMGqJqbevfxjs4pvVpmVIhrKRQsDaWF0jHC+kwfmLy424LrgYCoQoKBO5/yNxNNXO2rznTUlJi5CrPvsmH7abJZ1c8HyX5XQrKayWGaHeuAKU/D3KEk4RdK2ttO0CYNqNxIk6+eXxuzUIZPDpGQuUvCYgjF22W5GdWtdWllULAL/rES55SRYF9tTg6R1GEAhfH4e0AaQQplKGkwYBruYLy91L2oOfYxPp8BYben4cV82wk5oSXNmTwzt2yngRE4uV9A==
Received: from SI2PR06MB5385.apcprd06.prod.outlook.com (2603:1096:4:1ec::12)
 by SI6PR06MB7165.apcprd06.prod.outlook.com (2603:1096:4:252::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.28; Wed, 3 Jul
 2024 12:14:02 +0000
Received: from SI2PR06MB5385.apcprd06.prod.outlook.com
 ([fe80::967d:afda:6f4:33dd]) by SI2PR06MB5385.apcprd06.prod.outlook.com
 ([fe80::967d:afda:6f4:33dd%6]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 12:14:01 +0000
From: Lege Wang <lege.wang@jaguarmicro.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"vattunuru@marvell.com" <vattunuru@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "parav@nvidia.com" <parav@nvidia.com>, Leo Liu
	<leo.liu@jaguarmicro.com>, Angus Chen <angus.chen@jaguarmicro.com>
Subject: RE: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Topic: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Index: AQHay2kF67vqaBJYMUW1XCStKdNnOLHjWBeAgAEuLyCAACjYAIAALjYg
Date: Wed, 3 Jul 2024 12:14:01 +0000
Message-ID:
 <SI2PR06MB53851F07C15BDC46C74079B5FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <20240702073359-mutt-send-email-mst@kernel.org>
 <SI2PR06MB5385E3CEC459963A7D079B56FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <20240703042525-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240703042525-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5385:EE_|SI6PR06MB7165:EE_
x-ms-office365-filtering-correlation-id: aa2bc20b-8b42-49ca-bf5c-08dc9b599fc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?3elEWBHcXw1QtfhsHxGXAf3f5LWPsEZwcVJ3PlXNcYSQVZCyDZ6OJ8am?=
 =?Windows-1252?Q?uNskaJiRwVIIh8+puQqbZVK1/7+K9XN6/vP7BnFYAOnrrBYNs1N43uwE?=
 =?Windows-1252?Q?o0hKdWIP5B7FnfI8WkaCHK+YvvFAA1LB2cWCxGGcID4navHRvHVjw9T0?=
 =?Windows-1252?Q?83xIuYYOsGRtGRBRz+dZEApS4c+mS0gCeBzed4YdFoVGxbdGUqXPu7jn?=
 =?Windows-1252?Q?Ban+9ZYL4wgGh7a/9UXugTqystz0s97OgmnHwYCPg0o+P5M0U9VQPPrb?=
 =?Windows-1252?Q?ZtYy7fJt8kUyljVSIOs6oKhG1lU0EjUm8bOpIpTjKcxJl3UHh9ayEiao?=
 =?Windows-1252?Q?tjdwtnUmRcjrxl/CLy+J7Gqe749Cowmj0jDZPX3GmnWdk7idC+J9Q0RE?=
 =?Windows-1252?Q?lwqxGr+r/NKARq7GYLxsuaYLJZnRiYPuOo8stQzvoixGEd+9e8akHH7t?=
 =?Windows-1252?Q?gp8zVhyKCw9US5LejifgK0SIxy7NoLdUDl6kaqDWhjmsqI/GKzCugdcr?=
 =?Windows-1252?Q?TjztLahEhr6L77kQdw4iJlKEpfAUvBOfH7AeakCa9Cd9yaWnuUVelwD5?=
 =?Windows-1252?Q?ZInGrTqYx1wSxjHs08YIQe2B6RSs/PtUPSxlP86NM101g2nNHeSdby6Y?=
 =?Windows-1252?Q?BlMYujqaFQIqUxTDZ4l4xDGLcAFrKzEpYgK8PA4fGaw867LOD8HZCr80?=
 =?Windows-1252?Q?kajBxqO1+pjdzrkwEdvZE3UyaD9gxKZOWtqV1bDCQovTXQE8elMUnzei?=
 =?Windows-1252?Q?T9VoyYDhICux1T0ucE/nvZrQMFqdkjYeCQwP2TiMeAnRddroUvdMetyM?=
 =?Windows-1252?Q?ZTspIBl3Ju3BG5AmEO/GwJzwtMJfTx80lM3jpAOLx+g8/tX6QJckLleE?=
 =?Windows-1252?Q?Bb4/llb9bKF7o51WOS/ptC9dh4NyHdeG4JpxUsz23tEGF3ulVojrMeDy?=
 =?Windows-1252?Q?ziwN4PcOeuLAPPhS87uHdcNgskvfwxNWxRV/Wft0I5Q9irnqWef6d1Sr?=
 =?Windows-1252?Q?84wOlzMe/FBcPH1yrbvqP71JGND9twTCDDtbJDnx3x0grCOxK/dZ0hlm?=
 =?Windows-1252?Q?LcPyhvnLwX7WYGRjwwQFukK9+NyI5PWo/ZSYv/eg2fWCtgJY+dwiKA61?=
 =?Windows-1252?Q?0niSqVrSRTmKKDb7m+I3gv7KXfXCzL97hc7QJ/OQTYcSRfPcoHZkw/ES?=
 =?Windows-1252?Q?IxDPZP3VD19Csdn9V9Pa4w75g75XfUu83hPty4toz4IZ4DQelT8cxALz?=
 =?Windows-1252?Q?y33tcKSORJoABGhdKCCL/M36gguVNOr5cJS+IPA14AvrsA/BiGUkzG95?=
 =?Windows-1252?Q?InvFL1wO0ueXsDrXXSWuth6mVg8GZeK2WjasFDqIz4qZwXln6L5D6MK8?=
 =?Windows-1252?Q?dr8KQjWtitqqkU3agjdbi5aIORTPaZx7Y9SQBSZvy5C1K3ek9fU6mFeu?=
 =?Windows-1252?Q?jcgxv2kWwxExrlfEozPeAyNGN9l6N5JcczT8wgg3HCs8TgOTzIOykuXa?=
 =?Windows-1252?Q?H1byCTaxadgfcCKGlgHkGw32Hwkh2g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5385.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?s7nCq7aguCJDnycnB0S24EK7QciYyFen0XMmAfI14nLwPySikJefyApt?=
 =?Windows-1252?Q?HnbH+Fa/aGRnGHJa3WJ3sCC/bSlDK0biDekeVRH8YrFrNuOgi88SlH+X?=
 =?Windows-1252?Q?YsTD/uDoxymAhaHdrqsDAxham07b+vacHaE/oCMVFkt8fXGskXl2GPAk?=
 =?Windows-1252?Q?X3ZadHEux0RpR0p8s7UUvLtGZlBB3M1wLN16cLqV3ecRX5MXDEixqn8W?=
 =?Windows-1252?Q?fz8ashe+vFsCB2yMz89qbfKipKuyXn2knLSk9EJOq68+EGeVTf2UoFov?=
 =?Windows-1252?Q?QoLv6y6Jf2bDVhybv5rzDRHUZfuM1eSyhqbgNiJuoc9pOhOpO2SB10aj?=
 =?Windows-1252?Q?NqPmz2EX83drwZxUSxFrkBc2GiUefun8WHqLhoUM4IPiAXjBz72gVCRg?=
 =?Windows-1252?Q?m5uynRujsK6FqPHwqfzMGLFq6EFoaQakaua+qRetZEx1soW6aLY/rovK?=
 =?Windows-1252?Q?moB+tYgJ6tlObxx/JJw9JSnrAu7dZWJN703Nh1KAnBnAIPakGvXJcgAH?=
 =?Windows-1252?Q?ehqsY/xPDSappYWGa0hdhoFnKmKO5XnO9+KyT3hU73wGFvm/X7tZ8Ans?=
 =?Windows-1252?Q?5qoCmbMdCV3iWfPu2a+7QDf4MPahXVZywmE+OuQzIDGxOK5OOPQnl7n8?=
 =?Windows-1252?Q?8eDyt7oiOcmivs4lafVWaSIEvZjZModiVm7qMPRohe/tmH+NHmMmq37M?=
 =?Windows-1252?Q?lpvTSpTl3RqlQShie0XBBVoaJg1mNr1ykWULU7L1QndkkTrrYu+YbdrI?=
 =?Windows-1252?Q?aktWVVD7aLxDN5OL8YBYcn5ZwrCBH/SGRQgyHFlG85mmpvhrY5RIC2ux?=
 =?Windows-1252?Q?il2LMWoJZf8QRzF/DyiXm+EL1fJXAzC/f48iNo10du3u5jLeCU/8x83Z?=
 =?Windows-1252?Q?wu/QUqQ21qKr0Ny1ErY+MIWbQwfj4gmQim4lQ0wj+vpytobtyguZh/Ge?=
 =?Windows-1252?Q?Bc8WcGkt/MN84zOFkfr2Rn1tjQ/gNuemyP9jpqJBB9F0W4T3GTwKF2ES?=
 =?Windows-1252?Q?hyPpDKPA7TGXtWXdWqbuBN+SXB9iDR37RDs673l+0HCfx116OTegZXAk?=
 =?Windows-1252?Q?aqRzyyBIuniiSnsiQzSk+h/OR9reQN7MbndWJjj17wOkoYQ7J7beU7Pd?=
 =?Windows-1252?Q?8iVIYH4GEZ0EeMFTqVwNRjRMA09wF5CtloNfCYAdg/DlsNLo98Buz2jG?=
 =?Windows-1252?Q?FQ3SnPCgHnE0dJMcTqJm1qs+HjAyvDM94NMIXHpjoGSVNxBYI/61tyrV?=
 =?Windows-1252?Q?I+KYQ1CtWj65yYkrisPhpFQhRCzm+zglTlgrT6l1w0IY1Bs4Pl9RgGi3?=
 =?Windows-1252?Q?4WZUfsV+qmGPQcf7W/45wjpsTc9U/bD7sFwwiHmMutMswZLOVLMAz9wR?=
 =?Windows-1252?Q?+6ZPW86yNca2XkENBup9BBZII9AIRbMBxQc6uUOTKHbWy5xrQ0Rd4gxQ?=
 =?Windows-1252?Q?W38nEDFKwrXHh8gDHlNe9j+KJFvj3Ldm7TQEUzSDUL6xAasWM8sEFKIK?=
 =?Windows-1252?Q?39UHARxHsv998+pHS07ZQz4rSgZXvj2NTGoVHbVAWx4IjoKp4q8GYJJU?=
 =?Windows-1252?Q?aGsMp0mEh5054LY45BYfjnRV1h68i4J1V/EUHdgyMYWBCHdRHfTPGs3L?=
 =?Windows-1252?Q?fnTt35ioNw5gSNWyJToA4AoXy6aq9Zk5E++vY1woISbG6TN63OS+HtUO?=
 =?Windows-1252?Q?NGBoIp+yAbWggghAXSrB4cILGiWottb+?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5385.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2bc20b-8b42-49ca-bf5c-08dc9b599fc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 12:14:01.4296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gKcqYGvRKQvEFVK9HhsGljJwKX/jaoaRfXJk1zgIEdDDpE0JOtH7vUgPmJtHS/s88kSwDsvyO84qF+2lto7jZtJBkAKSLGr7XAw0EzA9PwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR06MB7165

hi,

> > > After reading this and the text, I can't figure out how is this featu=
re
> > > supposed to work without races.  What if the device uses a buffer whi=
le
> > > the driver notification is in flight to the device?
> > Hmm, I think it doesn't matter, Only the used buffer enable notificatio=
n is
> > transmitted to device successfully, device starts to judge whether it's=
 time
> > to send used buffer notification to driver according to its internal in=
terrupt
> policy.
>=20
> I don't understand what you are saying. If device has some magical
> interrupt policy why do we need a notification from the driver
> at all.
>=20
> Conversely, if device relies on the notification and thinks that an
> interrupt is not needed (because it did not get the notification yet),
> while at the same time the driver is blocked waiting for an interrupt,
> we get a deadlock.
No, I'm not saying that our interrupt policy is magical?? Let me explain a =
bit
more about its simple mechanism here, there're two basic parameters to cont=
rol
whether device should send used buffer notification to driver:
  1. number of used ring entries written since last used buffer notificatio=
n to driver,=20
    say threshold value is N.
  2. Max wait time to send a used buffer notification to driver.

The work flow would look like below:
1. driver enables used buffer notification initially when enabling virtio d=
evice
2. driver is blocked waiting interrupt.
3. if the number of used ring entries written by device is equal to or grea=
ter than above threshold N,
  a used buffered notification is sent to driver immediately, or if this co=
ndition is not met, but the period
  specified by max wait time has reached, device will still send one used b=
uffer notification to driver.
  And device will recount number of used ring entries written by device fro=
m zero and start another
  Max wait time timer.
4. driver is waken up by interrupt, after it has processed used ring entrie=
s, it'll start to wait for interrupt
  again and enable used buffer notification.
5. go to step 2.

From above work flow, I don't think the deadlock you describe would happen.

Regards,
Xiaoguang Wang

>=20
>=20
> --
> MST

