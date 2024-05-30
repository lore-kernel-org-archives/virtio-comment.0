Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB8317D341
	for <virtio-comment@lists.linux.dev>; Thu, 30 May 2024 11:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717070096; cv=fail; b=MnPj0xugWCa+r++w3p6/hcIBPKoVD/tnNPBS/HTjAl2Rlxvr7B0/FcULyzZ9/ZpJXG8cqj1xdErXE+8OEOUaQ00c6ocX1VGSY8woxEs+k/JF/0bbInBU+MzF2IGdn1KCLAPnGhsjD/NKHFvygcJHj+CD36E8MTGEFt0f+yAYc2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717070096; c=relaxed/simple;
	bh=eknmEJWc9FrF5IAkskCKpfhIlrgp3GQwx34ymYBnB1I=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bqCLsBCC5SDJsEaH2kRbVtaTDz0h+bI3IN3ofB2TAiIoGUFkKOOoB1j9hZxS2cD0Jxtc8owS0XNc7sGhT2kqolMUvQSfF3jeHgskgVUE2ppskXbtqNoNUUGz1h9m7In5XOWNFgdE2j9BIauvAIQuhCJYRUn1HUcsK+uJV/Cmg4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uXFKOEvd; arc=fail smtp.client-ip=40.107.220.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uXFKOEvd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E00YbuWv5oOso/kX64maLmGskh7bjfYKGCIukb2wGSenUb/gn/WE/HLBlbUo7pM4XRNsqexN1pb5YBOsahm9sfgUNJbe9GjHptzbqJZwj50h9wyuOnlAUcgDOOaFEhirXxYdFi6DlXOiqCyPGCeK/RcoiistVE1PZFyh4lEACFO1CDJ8M6s/cgceemAfRUg5q9begXNWMjFQrpcDcGw0gZ2QLEpH1v75fwrV+BtA/S0SNzxnzjEqPsEyHCJLBtD+qtsEfx4egmfcpp550FAE8UpmNj4Y57ACudlLRQ2XoDKp2AGN5q2yQ7sXqzPJHsrSFZeY+DGALzZGs8xEds+x9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eknmEJWc9FrF5IAkskCKpfhIlrgp3GQwx34ymYBnB1I=;
 b=WfR4+tDuPNcKtkBbYnQuTA4y5/+n1PZcgakO/NnGY0vw4IT/6/rOb2eEpx3a/N5jj5Xohd4sgMn20rme3q5eapiRx0HjnkygEBsB1Kx8AIVhtNdW/HjDplYMndPOSSSLxyW4IlCxc4x53LuDZptxpW7OKFNhW7yKc4IOZuWt+/id+QMnyr0ihyWC410ZNSQNpqIEZ+sJLnKLbKqEVPZpSFmbpHp9VXziNIU1y9Cf7dsgR/s8wxyUwltfRMw+pFoWN5VsljQY/tXlLHBUBTSOHSIgu9T51TLd6/8eRY3Sj9+IVoftiQRGeuqhAxhYUu00ZT8cA50R4cO3vAUbY17wCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eknmEJWc9FrF5IAkskCKpfhIlrgp3GQwx34ymYBnB1I=;
 b=uXFKOEvdzAQS27FHVD6SQTpZMf88Hf7Bmysuw4qyOoy6bhLGfoqPKGZYyNc45MEK/y1gz73FByf1mB65C3I/tgkKixah6Et3LJt80vyOx7E/+WMI3EpjKXaKQ7xkRHbD3rDlvYCRiSFpUzE8ISfLWF/kXrwOJ90IUoLBgsamPkdaZxfZpzV011R+p6nOlqYfxyszkv7Afo4w8gI4kf9w77+hHSEGFYtQYzGaYSxUFSwcjm55VONB05e5gb7GcQlYTjPXd7Ee0V27s85hDxFx6wr4dA5kEBQAxdhMXSTQ8sRySv5ccP8XBq5xyKXDL+Eqqhlg/pqMJaTBpbEmGcRRXg==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by CH2PR12MB4117.namprd12.prod.outlook.com (2603:10b6:610:ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Thu, 30 May
 2024 11:54:52 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 11:54:52 +0000
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [Request to merge: editorial] Fix admin to administration
Thread-Topic: [Request to merge: editorial] Fix admin to administration
Thread-Index: AdqyiAJ1cc1W9ZiIQhe2TjSylvZwoA==
Date: Thu, 30 May 2024 11:54:51 +0000
Message-ID:
 <PH0PR12MB54810E16E35AEB44AD31C341DCF32@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH2PR12MB4117:EE_
x-ms-office365-filtering-correlation-id: 10e1405a-deb7-402f-33c5-08dc809f50ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?qy8RNSmEpV1qX4GgwmPdTe3clouWsHc/b5O01Mf3+QO7r4pnQIoMXAYBHzu+?=
 =?us-ascii?Q?R11walFe2w45/9YeJv3ruyrSqUSRr+6J5GWNJKi2TvcQPqNjN9uKGd9OqRzd?=
 =?us-ascii?Q?TuToMEk7W7BmUvyppJHJ147CylrzAcPqSwsbQSIV+qf2eEbok1apijub4aqz?=
 =?us-ascii?Q?WaBPFruE9PBrxJZID1sQ/Kg6ESSVVDFAJ86JHkRj+IQ11JTrRdJmNP4mkefe?=
 =?us-ascii?Q?PUHE9wUKFudLyV0GSV98DdMNYnfkJEdSwrJ7LOnRVaE0Hzky7MEoXUiYVm2l?=
 =?us-ascii?Q?QvjAnvhJvnLarITZTd0Vp5jH5MUh2wlUoYojr74WLaNv3yfMQhQQ7ok0EiKS?=
 =?us-ascii?Q?Ls7BEyzPr4G8ALqgigP5EB/cZ1Bxqlewvob5RcMC1dF5/5vmI+HoKtUcqOzE?=
 =?us-ascii?Q?74jvKW5AW9ESa+qfjzxERjTQNmcl/OhA2/fLPtMotPA0vpH5hDigackkzDuA?=
 =?us-ascii?Q?AE74e41wZvlhh5Hb6hKh4Mq1O45zgBK7eTLOmw82uWQm/a7WnoBacvcM1G6Q?=
 =?us-ascii?Q?UwYTWLmJChmzNlMW+YY+rl3gC+28Uvs0HpPG+abUr0/3tAhTniC2zCRNhpMg?=
 =?us-ascii?Q?eo6V8VO4xxuazyQ6E3c8FVAQ6hpv7/10BfXjtxpQ+9RR7CWJxLySiQxWb1GZ?=
 =?us-ascii?Q?8kWXkNJ53Toa0Ps1gh4D2/m12z6NN8FiYpY0RRhjiKJZPQnNc/fNsUuoT3SE?=
 =?us-ascii?Q?fZBjLbLRHxmsUR/rtiI9cotPphkNSIMIHrk3e0OGos8p5caXEl9uv7So/B1r?=
 =?us-ascii?Q?U0+E4FgW0WHBkeCW+E5w9apWRCppeU1hSEKvFLtzXGnybROzqyz1RJXuvnIs?=
 =?us-ascii?Q?7c3xnX1xNcjFcZ1sJNp2qODNOqnVy4T+M6uAoFqS7baQdtDOxmlXY+QBNBov?=
 =?us-ascii?Q?xNAiOe8UNsco90ZYvvLJycgRDpj8dOb5T/E2ow9MUnQXcumXv6ac+mXvDAjg?=
 =?us-ascii?Q?f5BlcX3yRcsS/ZJzlRAqaRCHQI7rlL7n2neUsLBlZixpJl5+luKRlrnSGHp6?=
 =?us-ascii?Q?oWCaubmwntUoHm29yH/Pg/3J4KvIiRYS6/iDT4JY9NE5I9Re1gb7jHwBBlZw?=
 =?us-ascii?Q?8GaHYVecZjF1Arl0WcKtFJfJu5VDrR4t/88QoarXNjMwArfrgSdAOLJOkiDX?=
 =?us-ascii?Q?p3E8aDBieSWcbz3XgLOi1nrDW7F7dolDuXMCkEbYLR7Ykf2VcCI2rxwmN8Po?=
 =?us-ascii?Q?59Oxqm2solEkEqvdAuhI/aLJDDDkfejoSPc5aDEkVkVx6bHUHl3sKRxrnDy9?=
 =?us-ascii?Q?dHS353noUTXT+p0Mf1cDcP/NRgG1E9eBsvIa5MDfLg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8bLOUeb6c6V/C3hCzgM9AHsnp9m2jeM28yVkkkO2g8eYlGTLFyWCwDHpaucj?=
 =?us-ascii?Q?VrP5wESDjko6PJjEaAnnAQAjooahFvw3rsCTQqWL159xv5YRaltPQvn5dwFh?=
 =?us-ascii?Q?k8LXDdYGYTrXcYrqJfVEkfCocIbbDyuBnCH8pIqpgQYgZbm6heUkOIz6RDuA?=
 =?us-ascii?Q?CTjE1JeLeyaFEs47tS6if3OfZWkf/mf+vFJ/WEfcpw+IypmDfR+AQ6dTNCOP?=
 =?us-ascii?Q?o9+LlSGmR2lmLQ7m959Q6Sq9i1qA0MasIIXN3cP3sVbvm+cACBmaBCjFFGV8?=
 =?us-ascii?Q?czmS8dyQsgcrP6Ka3bqGiMTp5IF4pHT51HUvpFMgxNRm4Lua24LJldlZaou6?=
 =?us-ascii?Q?Xhd3aQqml3GpF3wzXYlTuzDFrW8gb1zXtBTL6tT583gatNoHygb9JLs7gbe5?=
 =?us-ascii?Q?We6uqXytdAteSGcA1JuGRgulfZKFzdX4BA0StpirZSqm9cSxFQAKman9dE6x?=
 =?us-ascii?Q?M66HX/qDG2cK3VVbYJo8+f+CWIePjqEcIF43FNaJfKea1EAAhUJrF7jkiB0N?=
 =?us-ascii?Q?yybuHK9nUnYavBYnQAVRHE2sk/FHZ+KN7QFk+5w3Y4RnZ3UVjM6WqS5y/NpX?=
 =?us-ascii?Q?Hl22kW72obXCcqA0DQfUJO8Ff05bupVI514jixp1fPAruclrtA0defYkXYnV?=
 =?us-ascii?Q?nGWMF69ILnmokQrcQdTWkDFmcN0Dc96cO6rzVqnkApCOLtNzVrs8LbTtOMvy?=
 =?us-ascii?Q?MN49PbIqRHL4jdXwVChCPvFOD1l4mg7hfokS6XdgfD0Avt37bJMka18HxyXP?=
 =?us-ascii?Q?+HmHOL3cm44sP5qbt5mEZ56Sb/esnKocOE80HNP/Q/k0EOG2KvPHGlgPnNxL?=
 =?us-ascii?Q?ahqbuQCny+rU+WCWuVSmO2nmwI5ygqI0ujfgaswLCbETeCi2DfxA9+Ly62TY?=
 =?us-ascii?Q?MUW76yPQMX0YvMcYeyUgJqlWl+mltFGO6tASDjQOIXrYVwQ+605yjhDdQbZ6?=
 =?us-ascii?Q?mabZi0JNIlQX9/qKcHg6ZjLdD5dgTFKkHpsM6EqFpvoZ8FPUKL5i7JzCWcUm?=
 =?us-ascii?Q?DKgEUSOt9rNBGwpBKkJFI5wrt4jCe2Lz+BxzyxBB7JazfT9ZgJrdfiF8qmiJ?=
 =?us-ascii?Q?9JMmNirbkDWc3v08AkxJ/Xnx/Jxe5McRCbF8FFXZQrrqFDiEGSLhMrhBTUmg?=
 =?us-ascii?Q?K2d1wKH24D8v+wFRPLzeIPi5R2+QR6ozZSZRmKNUUW+QULn3LC1TGTAicQkV?=
 =?us-ascii?Q?Z02z4l9rr53J1Q4Gu1j5kpl09Ro0aFcmTz2sJSz5IYDyQTR+K5snhGJNMBzS?=
 =?us-ascii?Q?c+NhfWi3pb9e7kAzvf7RUVvL63T/cyADrIfLLudPhpdHYqJC3meLAJOjbwRy?=
 =?us-ascii?Q?yF0i3SJfz6MnjFo2rvrRqmWnMYcqTdR52t67hY6w1ViyZfqMIAVupHgErFPc?=
 =?us-ascii?Q?ULsL2IT1G2F7JfNP/g34Tamt5I4fJZFXxCObdH6gpduhDPLA6wOAVEA0OE59?=
 =?us-ascii?Q?OxdYScn161YdE2VSrzhaNDlaLIQg3A1iCJuUoBtlPiQKraV6DnlqYHdF54+K?=
 =?us-ascii?Q?3JoJ/mRckZIfkwMakPm/PlyOvemfq0DGSznihK3RKnokSjtlKxBPy0eyUiK8?=
 =?us-ascii?Q?I09DgiHbTYyNQt/cd8A=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e1405a-deb7-402f-33c5-08dc809f50ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2024 11:54:52.0765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tPQPl8OIE7DApgf0nGVwBZd+fUzssHRyHOf7WGksu7pwqlj/AYeDYrfFf7WLkBrTr1s7F/wjB9Gr87iedaXvxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4117

Hi,

Can you please merge editor change of [1]?

[1] https://lore.kernel.org/virtio-comment/rkvznbkvylpld4basur3qxjsmsncawpt=
2hpwohrrg77yxwp4zc@i3l6t3htp4oj/T/#t

It is posted on 21st May 2024.

It is:
Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Regards,
Parav Pandit
